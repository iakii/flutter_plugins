//! JsRepl —— 交互式 JS REPL（Read-Eval-Print Loop）模块。
//!
//! 参考 `boa_cli` 的 REPL 设计，支持：
//! - 跨行状态保持（变量、函数定义在多次 eval 间持续）
//! - 多行输入检测（通过 `boa_parser` 真实解析，检测未闭合语句）
//! - `boa_interner::Interner` 管理解析器符号表

use crate::api::js_error::JsError;
use crate::api::js_value::JsValue;
use crate::api::runtime::JsRuntime;
use crate::js_runtime::worker;
use boa_ast::scope::Scope;
use boa_engine::Source;
use boa_interner::Interner;
use boa_parser::Parser;
use flutter_rust_bridge::frb;

/// 单行求值结果。
pub struct ReplResult {
    /// 求值结果的字符串表示
    pub output: String,
    /// 结果的结构化值（与 `output` 对应）
    pub value: JsValue,
    /// 此行是否完整（`false` 表示需要继续输入，如未闭合的大括号）
    pub is_complete: bool,
}

/// JS REPL 实例。
///
/// 包装一个 [JsRuntime]，提供逐行求值能力。
/// 内部维护代码缓冲区，支持多行语句拼接。
///
/// FRB 标记为 opaque：内部状态（buffer）在 Rust 端维护，
/// Dart 端通过句柄调用方法。
#[frb(opaque)]
pub struct JsRepl {
    /// 内部运行时 ID（使用已有 JsRuntime 的后台工作线程）
    runtime_id: u64,
    /// 未完成的代码缓冲区（多行输入累积）
    buffer: String,
}

impl JsRepl {
    /// 创建一个新的 REPL 实例。
    ///
    /// 内部创建一个 [JsRuntime]（含专用工作线程），支持跨行状态保持。
    #[frb(sync)]
    pub fn create() -> Self {
        let runtime = JsRuntime::create(None);
        let id = runtime.id;
        std::mem::forget(runtime);
        Self {
            runtime_id: id,
            buffer: String::new(),
        }
    }

    /// 提交一行代码进行评估。
    ///
    /// - 如果当前行是完整语句，返回 `is_complete: true` 并清空缓冲区
    /// - 如果当前行不完整（如 `function foo() {` 缺少 `}`），返回 `is_complete: false`
    ///   并将内容追加到内部缓冲区，等待后续行继续
    #[frb(sync)]
    pub fn eval_line(&mut self, line: String) -> Result<ReplResult, JsError> {
        if !self.buffer.is_empty() {
            self.buffer.push('\n');
        }
        self.buffer.push_str(&line);

        let is_complete = !needs_continuation(&self.buffer);

        if is_complete {
            let code = self.buffer.clone();
            self.buffer.clear();

            let (output, js_val) = worker::repl_eval(self.runtime_id, code)?;

            Ok(ReplResult {
                output,
                value: js_val,
                is_complete: true,
            })
        } else {
            Ok(ReplResult {
                output: "...".to_string(),
                value: JsValue::None,
                is_complete: false,
            })
        }
    }

    /// 强制执行当前缓冲区中的所有代码（即使未闭合）。
    #[frb(sync)]
    pub fn force_eval(&mut self) -> Result<ReplResult, JsError> {
        if self.buffer.is_empty() {
            return Ok(ReplResult {
                output: String::new(),
                value: JsValue::None,
                is_complete: true,
            });
        }
        let code = self.buffer.clone();
        self.buffer.clear();

        let (output, js_val) = worker::repl_eval(self.runtime_id, code)?;

        Ok(ReplResult {
            output,
            value: js_val,
            is_complete: true,
        })
    }

    /// 清空代码缓冲区。
    #[frb(sync)]
    pub fn clear(&mut self) {
        self.buffer.clear();
    }

    /// 获取当前缓冲区内容（未完成的代码）。
    pub fn pending_code(&self) -> String {
        self.buffer.clone()
    }

    /// 获取内部运行时引用，用于直接执行 JS。
    pub fn runtime(&self) -> JsRuntime {
        JsRuntime {
            id: self.runtime_id,
        }
    }

    /// 运行垃圾回收。
    #[frb(sync)]
    pub fn run_gc(&self) {
        worker::run_gc(self.runtime_id);
    }

    /// 关闭 REPL 并释放运行时。
    #[frb(sync)]
    pub fn close(self) -> Result<(), JsError> {
        worker::dispose(self.runtime_id)
    }
}

// ─── 多行检测 ────────────────────────────────────────────

/// 检查 JavaScript 代码是否需要续行。
fn needs_continuation(code: &str) -> bool {
    let scope = Scope::new_global();
    let mut interner = Interner::new();
    let source = Source::from_bytes(code.as_bytes());
    let mut parser = Parser::new(source);

    match parser.parse_script(&scope, &mut interner) {
        Ok(_) => false,
        Err(e) => matches!(e, boa_parser::Error::AbruptEnd),
    }
}
