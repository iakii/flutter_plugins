//! JsModule —— ES 模块定义。

/// 一个 ES 模块，可用于注册到 JS 运行时中。
///
/// 注册后，JS 端可通过 `import('name')` 动态导入。
pub struct JsModule {
    /// 模块名称（import specifier），如 `"my-lib"` 或 `"@scope/pkg"`
    pub name: String,
    /// 模块源码（ES module 格式，支持 `import`/`export` 语法）
    pub source: String,
}

impl JsModule {
    /// 从名称和源码创建模块。
    pub fn new(name: String, source: String) -> Self {
        Self { name, source }
    }
}
