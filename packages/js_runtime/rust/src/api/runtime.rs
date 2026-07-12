//! JsRuntime —— 低层 JS 运行时 API。
//!
//! 参考 FJS 的 `JsRuntime` 设计，返回类型化的 [JsValue] 和结构化的 [JsError]。
//! 适合需要精细控制运行时生命周期的场景。
//!
//! 高层封装见 [super::engine::JsEngine]。

use crate::api::builtin_options::JsBuiltinOptions;
use crate::api::eval_options::JsEvalOptions;
use crate::api::js_error::JsError;
use crate::api::js_value::JsValue;
use crate::js_runtime::internal;
use crate::js_runtime::worker;
use boa_ast::scope::Scope;
use boa_engine::Source;
use boa_interner::Interner;
use boa_parser::Parser;
use flutter_rust_bridge::frb;

/// 运行时选项。
pub struct JsRuntimeOptions {
    /// 内存上限（字节），`0` 或 `null` 表示不限制
    pub memory_limit: Option<u64>,
    /// 运行时标识名称（用于调试）
    pub info: Option<String>,
    /// 内置模块配置，默认使用 [JsBuiltinOptions::essential]
    pub builtins: Option<JsBuiltinOptions>,
}

impl Default for JsRuntimeOptions {
    fn default() -> Self {
        Self {
            memory_limit: None,
            info: None,
            builtins: Some(JsBuiltinOptions::essential()),
        }
    }
}

/// JS 运行时句柄。
///
/// 通过 [JsRuntime::create] 创建，使用完毕后调用 [JsRuntime::dispose] 释放。
/// 每次调用会创建一个专用的后台工作线程来执行 JS 代码。
pub struct JsRuntime {
    pub id: u64,
}

impl JsRuntime {
    /// 创建一个新的 JS 运行时。
    ///
    /// 内部启动一个专用 OS 线程来运行 Boa Context，
    /// 所有后续操作通过 channel 向该线程发送命令。
    ///
    /// # 参数
    /// - `options`: 运行时配置选项，`null` 使用默认值（无内存限制 + essential 内置模块）。
    #[frb(sync)]
    pub fn create(options: Option<JsRuntimeOptions>) -> Self {
        let opts = options.unwrap_or_default();
        let id = internal::next_id();
        let max_memory = opts.memory_limit.unwrap_or(0);

        worker::spawn_worker(max_memory, id, opts.builtins)
            .expect("spawn_worker should succeed");

        Self { id }
    }

    // ─── 代码执行 ────────────────────────────────────────

    /// 执行 JavaScript 代码，返回类型化的 [JsValue]。
    ///
    /// 自动解析 Promise（通过 `await_blocking`）。
    /// 实际执行在工作线程中进行，不阻塞 Dart 主 isolate。
    ///
    /// # 错误
    /// - [JsError::Syntax] — 代码解析失败
    /// - [JsError::Runtime] — 执行期间抛出异常
    /// - [JsError::MemoryLimit] — 内存超限
    pub fn eval(&self, code: String) -> Result<JsValue, JsError> {
        worker::eval(self.id, code, JsEvalOptions::default())
    }

    /// 带选项执行 JavaScript 代码。
    ///
    /// `options` 控制 strict mode、global scope 等行为。
    /// 详见 [JsEvalOptions]。
    pub fn eval_with_options(
        &self,
        code: String,
        options: JsEvalOptions,
    ) -> Result<JsValue, JsError> {
        worker::eval(self.id, code, options)
    }

    /// 从文件路径读取 JS 代码并执行。
    ///
    /// 读取指定路径的文件内容，按 Script 模式执行。
    /// 实际 I/O 和 eval 均在后台工作线程中进行。
    pub fn eval_file(
        &self,
        path: String,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_file(self.id, path, options.unwrap_or_default())
    }

    /// 从字节数组执行 JS 代码（UTF-8 编码）。
    ///
    /// 将字节按 UTF-8 解码后执行。
    pub fn eval_bytes(
        &self,
        bytes: Vec<u8>,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_bytes(self.id, bytes, options.unwrap_or_default())
    }

    /// 读取文件作为 ES 模块执行（支持相对路径 import）。
    ///
    /// 文件所在目录会被设置为模块解析的基础路径（通过 `JS_MODULE_BASE_PATH` 环境变量）。
    /// 如需在 JS 代码中使用 `import` 相对路径，请使用此方法。
    pub fn eval_path(
        &self,
        path: String,
        options: Option<JsEvalOptions>,
    ) -> Result<JsValue, JsError> {
        worker::eval_path(self.id, path, options.unwrap_or_default())
    }

    // ─── 模块管理 ────────────────────────────────────────

    /// 预加载一个 ES 模块，使其可通过 `import('name')` 动态导入。
    #[frb(sync)]
    pub fn preload_module(&self, name: String, source: String) -> Result<(), JsError> {
        worker::preload_module(self.id, name, source)
    }

    // ─── 内存管理 ────────────────────────────────────────

    /// 获取当前运行时的估算内存用量（字节）。
    #[frb(sync)]
    pub fn memory_usage(&self) -> u64 {
        worker::memory_usage(self.id).unwrap_or(0)
    }

    /// 获取进程的物理内存用量（字节），平台不支持时返回 `0`。
    #[frb(sync)]
    pub fn total_memory_usage() -> u64 {
        internal::get_process_memory().unwrap_or(0)
    }

    /// 设置内存上限（字节），`0` 表示不限制。
    #[frb(sync)]
    pub fn set_memory_limit(&self, limit_bytes: u64) {
        worker::set_memory_limit(self.id, limit_bytes);
    }

    /// 触发垃圾回收。
    ///
    /// 在工作线程中执行完整的标记-清除 GC，同时清理 WeakRef 保持的对象。
    #[frb(sync)]
    pub fn run_gc(&self) {
        worker::run_gc(self.id);
    }

    /// 释放内存 —— 同 [run_gc](Self::run_gc)。
    #[frb(sync)]
    pub fn release_memory(&self) {
        worker::run_gc(self.id);
    }

    // ─── 生命周期 ────────────────────────────────────────

    /// 取消当前正在等待的 eval（或其他长时间操作）。
    ///
    /// 等待中的调用方会立刻收到 [JsError::Cancelled]。
    /// 工作线程中的 JS 执行会继续在后台完成（结果被丢弃），
    /// 取消后可以立即发起新的 eval 调用。
    #[frb(sync)]
    pub fn cancel_eval(&self) {
        worker::cancel_eval(self.id);
    }

    /// 销毁运行时，释放所有关联资源。
    ///
    /// 关闭工作线程并释放 Boa Context。调用后该句柄不再可用。
    #[frb(sync)]
    pub fn dispose(self) -> Result<(), JsError> {
        worker::dispose(self.id)
    }
}

// ─── 语法校验（不执行）──────────────────────────────────

impl JsRuntime {
    /// 校验 JavaScript 代码语法，**不执行代码**。
    ///
    /// 使用 `boa_parser` 解析为 Script AST，成功返回 `Ok(())`，
    /// 失败返回包含行列信息的 [JsError::Syntax]。
    ///
    /// 此方法不需要运行时实例，可直接调用。
    #[frb(sync)]
    pub fn validate(code: String) -> Result<(), JsError> {
        let scope = Scope::new_global();
        let mut interner = Interner::new();
        let source = Source::from_bytes(code.as_bytes());
        let mut parser = Parser::new(source);

        match parser.parse_script(&scope, &mut interner) {
            Ok(_) => Ok(()),
            Err(e) => {
                let msg = e.to_string();
                match e {
                    boa_parser::Error::Expected { span, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(span.start().line_number()),
                        column: Some(span.start().column_number()),
                    }),
                    boa_parser::Error::Unexpected { span, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(span.start().line_number()),
                        column: Some(span.start().column_number()),
                    }),
                    boa_parser::Error::General { position, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(position.line_number()),
                        column: Some(position.column_number()),
                    }),
                    _ => Err(JsError::Syntax {
                        message: msg,
                        line: None,
                        column: None,
                    }),
                }
            }
        }
    }

    /// 校验 ES 模块语法，**不执行代码**。
    #[frb(sync)]
    pub fn validate_module(name: String, source: String) -> Result<(), JsError> {
        let scope = Scope::new_global();
        let mut interner = Interner::new();
        let src = Source::from_bytes(source.as_bytes());
        let mut parser = Parser::new(src);

        match parser.parse_module(&scope, &mut interner) {
            Ok(_) => Ok(()),
            Err(e) => {
                let msg = format!("[{name}] {e}");
                match e {
                    boa_parser::Error::Expected { span, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(span.start().line_number()),
                        column: Some(span.start().column_number()),
                    }),
                    boa_parser::Error::Unexpected { span, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(span.start().line_number()),
                        column: Some(span.start().column_number()),
                    }),
                    boa_parser::Error::General { position, .. } => Err(JsError::Syntax {
                        message: msg,
                        line: Some(position.line_number()),
                        column: Some(position.column_number()),
                    }),
                    _ => Err(JsError::Syntax {
                        message: msg,
                        line: None,
                        column: None,
                    }),
                }
            }
        }
    }
}

// ─── 向后兼容方法 ────────────────────────────────────────

impl JsRuntime {
    /// 旧版 create 的别名：使用简单的内存限制参数。
    #[frb(sync)]
    pub fn create_legacy(max_memory_bytes: Option<u64>) -> Self {
        let opts = JsRuntimeOptions {
            memory_limit: max_memory_bytes,
            ..Default::default()
        };
        Self::create(Some(opts))
    }

    /// 旧版 eval_js 的别名：返回字符串而非 [JsValue]。
    pub fn eval_js_str(&self, code: String) -> Result<String, String> {
        worker::eval_js_str(self.id, code)
    }
}
