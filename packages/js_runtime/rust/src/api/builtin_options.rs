//! JsBuiltinOptions —— 内置 Web API 模块配置。
use flutter_rust_bridge::frb;
/// 内置模块配置。
///
/// 控制创建运行时向 JS 上下文注册哪些 Web API 扩展。
/// Boa 通过 `boa_runtime` 原生支持 Console 和 Fetch。
pub struct JsBuiltinOptions {
    /// 注册 Console API（`console.log` 等）
    pub console: bool,
    /// 注册 Fetch API（`fetch()` 函数，使用 reqwest 阻塞后端）
    pub fetch: bool,
}

impl Default for JsBuiltinOptions {
    #[frb(sync)]
    fn default() -> Self {
        Self::essential()
    }
}

impl JsBuiltinOptions {
    /// 不注册任何内置模块。
    #[frb(sync)]
    pub fn none() -> Self {
        Self {
            console: false,
            fetch: false,
        }
    }

    /// 基础组合：仅 Console。
    #[frb(sync)]
    pub fn essential() -> Self {
        Self {
            console: true,
            fetch: false,
        }
    }

    /// Web 兼容组合：Console + Fetch。
    #[frb(sync)]
    pub fn web() -> Self {
        Self {
            console: true,
            fetch: true,
        }
    }

    /// 全部内置模块。
    #[frb(sync)]
    pub fn all() -> Self {
        Self::web()
    }
}
