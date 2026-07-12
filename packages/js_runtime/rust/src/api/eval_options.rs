//! JsEvalOptions —— JS 代码求值选项。
use flutter_rust_bridge::frb;
/// JS 代码求值选项。
///
/// 注意：Boa 引擎 0.21 不直接支持所有选项；
/// `strict` 通过 `"use strict"` 实现，`global` 为默认行为（Boa 始终在全局作用域求值）。
pub struct JsEvalOptions {
    /// 启用严格模式（通过 `"use strict"` 前置实现；默认 false）
    pub strict: bool,
    /// 全局脚本模式（Boa 中始终为全局作用域，此选项预留；默认 false）
    pub global: bool,
}

impl Default for JsEvalOptions {
    fn default() -> Self {
        Self {
            strict: false,
            global: false,
        }
    }
}

impl JsEvalOptions {
    /// 默认选项。
    #[frb(sync)]
    pub fn defaults() -> Self {
        Self::default()
    }

    #[frb(sync)]
    /// 启用严格模式。
    pub fn strict_mode() -> Self {
        Self {
            strict: true,
            global: false,
        }
    }
    #[frb(sync)]
    /// 对给定源码应用选项（如在 strict 模式下前置 `"use strict";`）。
    pub(crate) fn apply(&self, source: &str) -> String {
        if self.strict {
            format!("\"use strict\";\n{source}")
        } else {
            source.to_string()
        }
    }
}
