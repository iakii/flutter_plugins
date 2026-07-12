//! JsError —— 结构化 JavaScript 错误类型。
//!
//! FRB 会为此枚举生成 Dart sealed class，支持 `switch` 模式匹配。

/// 结构化的 JS 错误信息。
///
/// 每个变体携带 `message` 和可选的上下文字段。
/// FRB 生成 Dart sealed class，Dart 端可通过 `switch` 进行完备模式匹配。
pub enum JsError {
    /// 语法错误（解析失败），包含行列信息。
    Syntax {
        message: String,
        line: Option<u32>,
        column: Option<u32>,
    },
    /// 类型错误（如对非函数值调用）。
    Type {
        message: String,
    },
    /// 引用错误（访问未定义变量）。
    Reference {
        message: String,
    },
    /// 运行时错误（JS 执行期间抛出）。
    Runtime {
        message: String,
    },
    /// 内存超限。
    MemoryLimit {
        message: String,
    },
    /// 栈溢出（递归过深）。
    StackOverflow {
        message: String,
    },
    /// 内部错误（引擎或桥接层问题）。
    Internal {
        message: String,
    },
    /// 任务被取消（调用方主动取消等待）。
    Cancelled {
        message: String,
    },
    /// 通用错误（兜底）。
    Generic {
        message: String,
    },
}

impl JsError {
    /// 返回稳定的错误码字符串，用于程序化匹配。
    ///
    /// 各变体错误码：
    /// - `Syntax` → `"SYNTAX"`
    /// - `Type` → `"TYPE"`
    /// - `Reference` → `"REFERENCE"`
    /// - `Runtime` → `"RUNTIME"`
    /// - `MemoryLimit` → `"MEMORY_LIMIT"`
    /// - `StackOverflow` → `"STACK_OVERFLOW"`
    /// - `Cancelled` → `"CANCELLED"`
    /// - `Internal` → `"INTERNAL"`
    /// - `Generic` → `"GENERIC"`
    pub fn code(&self) -> String {
        match self {
            Self::Syntax { .. } => "SYNTAX",
            Self::Type { .. } => "TYPE",
            Self::Reference { .. } => "REFERENCE",
            Self::Runtime { .. } => "RUNTIME",
            Self::MemoryLimit { .. } => "MEMORY_LIMIT",
            Self::StackOverflow { .. } => "STACK_OVERFLOW",
            Self::Cancelled { .. } => "CANCELLED",
            Self::Internal { .. } => "INTERNAL",
            Self::Generic { .. } => "GENERIC",
        }
        .to_string()
    }

    /// 判断此错误是否可恢复（可继续使用运行时）。
    pub fn is_recoverable(&self) -> bool {
        !matches!(self, Self::MemoryLimit { .. } | Self::StackOverflow { .. })
            || matches!(self, Self::Cancelled { .. })
    }
}

impl std::fmt::Display for JsError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let msg = match self {
            Self::Syntax { message, .. }
            | Self::Type { message }
            | Self::Reference { message }
            | Self::Runtime { message }
            | Self::MemoryLimit { message }
            | Self::StackOverflow { message }
            | Self::Cancelled { message }
            | Self::Internal { message }
            | Self::Generic { message } => message,
        };
        write!(f, "[{}] {}", self.code(), msg)
    }
}

// ─── 从 Boa 错误转换 ────────────────────────────────────

impl From<boa_engine::JsError> for JsError {
    fn from(err: boa_engine::JsError) -> Self {
        let msg = err.to_string();
        classify_error(&msg)
    }
}

impl From<boa_engine::JsNativeError> for JsError {
    fn from(err: boa_engine::JsNativeError) -> Self {
        let msg = err.to_string();
        classify_error(&msg)
    }
}

impl From<String> for JsError {
    fn from(msg: String) -> Self {
        classify_error(&msg)
    }
}

impl From<&str> for JsError {
    fn from(msg: &str) -> Self {
        classify_error(msg)
    }
}

/// 根据错误消息文本进行启发式分类。
fn classify_error(msg: &str) -> JsError {
    let lower = msg.to_lowercase();

    if lower.contains("stack overflow") || lower.contains("recursion limit") {
        return JsError::StackOverflow { message: msg.to_string() };
    }
    if lower.contains("memory") && (lower.contains("limit") || lower.contains("exceeded")) {
        return JsError::MemoryLimit { message: msg.to_string() };
    }
    if lower.contains("syntax") || lower.contains("unexpected token") || lower.contains("parse error")
    {
        // 尝试从消息中提取行列信息
        let (line, column) = parse_syntax_location(msg);
        return JsError::Syntax {
            message: msg.to_string(),
            line,
            column,
        };
    }
    if lower.contains("typeerror") || lower.contains("type error") || lower.contains("is not a function")
        || lower.contains("cannot read properties") || lower.contains("cannot read property")
    {
        return JsError::Type { message: msg.to_string() };
    }
    if lower.contains("referenceerror") || lower.contains("reference error") || lower.contains("is not defined")
    {
        return JsError::Reference { message: msg.to_string() };
    }
    if lower.contains("runtime") {
        return JsError::Runtime { message: msg.to_string() };
    }

    JsError::Generic { message: msg.to_string() }
}

/// 尝试从语法错误消息中解析行列信息。
/// 支持格式：`... at line X column Y ...` 或 `...:X:Y...` 等。
fn parse_syntax_location(msg: &str) -> (Option<u32>, Option<u32>) {
    // 尝试匹配 "line X column Y"
    let mut line = None;
    let mut column = None;

    let lower = msg.to_lowercase();
    if let Some(pos) = lower.find("line ") {
        let rest = &lower[pos + 5..];
        if let Some(end) = rest.find(|c: char| !c.is_ascii_digit()) {
            line = rest[..end].parse().ok();
            let after = &rest[end..];
            if let Some(cpos) = after.find("column ") {
                let col_rest = &after[cpos + 7..];
                if let Some(col_end) = col_rest.find(|c: char| !c.is_ascii_digit()) {
                    column = col_rest[..col_end].parse().ok();
                } else {
                    column = col_rest.parse().ok();
                }
            }
        }
    }

    // 备用：尝试匹配 ":line:col"
    if line.is_none() {
        if let Some(colon1) = msg.find(':') {
            let after = &msg[colon1 + 1..];
            if let Some(colon2) = after.find(':') {
                let line_str = &after[..colon2];
                line = line_str.parse().ok();
                let col_str = &after[colon2 + 1..];
                column = col_str.split(|c: char| !c.is_ascii_digit())
                    .next()
                    .and_then(|s| s.parse().ok());
            }
        }
    }

    (line, column)
}
