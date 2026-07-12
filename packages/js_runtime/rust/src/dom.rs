//! DOM API 模块 —— 将 HTML 解析 + CSS 选择器能力注入到 JS 运行时。
//!
//! 通过 [register_dom_module] 注册一个名为 `"dom"` 的 synthetic module，
//! JS 端可通过 `await import('dom')` 导入使用。

use boa_engine::{
    js_string, Context, IntoJsModule, JsNativeError, JsResult, JsString, JsValue,
    UnsafeIntoJsFunction, module::MapModuleLoader,
};
use scraper::{Html, Selector};
use serde::Serialize;

/// 单个 HTML 元素的序列化数据。
#[derive(Serialize)]
struct ElementData {
    #[serde(rename = "tagName")]
    tag_name: String,
    text: String,
    #[serde(rename = "innerHtml")]
    inner_html: String,
    id: String,
    classes: Vec<String>,
    attrs: Vec<(String, String)>,
}

fn extract_element(el: scraper::ElementRef<'_>) -> ElementData {
    let el_val = el.value();
    ElementData {
        tag_name: el_val.name().to_string(),
        text: el.text().collect::<Vec<_>>().join(""),
        inner_html: el.inner_html(),
        id: el_val.id().map(|s| s.to_string()).unwrap_or_default(),
        classes: el_val.classes().map(|s| s.to_string()).collect(),
        attrs: el_val
            .attrs()
            .map(|(k, v)| (k.to_string(), v.to_string()))
            .collect(),
    }
}

pub fn register_dom_module(context: &mut Context) -> Result<(), String> {
    // querySelectorAll(html, css) → JSON string
    let qsa = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |html: JsString, css: JsString| -> JsResult<JsValue> {
                let html_str = html.to_std_string_escaped();
                let css_str = css.to_std_string_escaped();

                let document = Html::parse_document(&html_str);
                let selector = Selector::parse(&css_str).map_err(|e| {
                    JsNativeError::typ().with_message(format!("Invalid CSS selector: {e}"))
                })?;

                let elements: Vec<ElementData> =
                    document.select(&selector).map(extract_element).collect();

                let json = serde_json::to_string(&elements).map_err(|e| {
                    JsNativeError::typ().with_message(format!("JSON: {e}"))
                })?;

                Ok(JsString::from(json).into())
            },
            context,
        )
    };

    // querySelector(html, css) → JSON string or null
    let qs = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |html: JsString, css: JsString| -> JsResult<JsValue> {
                let html_str = html.to_std_string_escaped();
                let css_str = css.to_std_string_escaped();

                let document = Html::parse_document(&html_str);
                let selector = Selector::parse(&css_str).map_err(|e| {
                    JsNativeError::typ().with_message(format!("Invalid CSS selector: {e}"))
                })?;

                match document.select(&selector).next() {
                    Some(el) => {
                        let json = serde_json::to_string(&extract_element(el)).map_err(|e| {
                            JsNativeError::typ().with_message(format!("JSON: {e}"))
                        })?;
                        Ok(JsString::from(json).into())
                    }
                    None => Ok(JsValue::null()),
                }
            },
            context,
        )
    };

    // getElementsByTagName(html, tag) → JSON string
    let gebtn = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |html: JsString, tag: JsString| -> JsResult<JsValue> {
                let html_str = html.to_std_string_escaped();
                let tag_str = tag.to_std_string_escaped().to_lowercase();

                let document = Html::parse_document(&html_str);
                let elements: Vec<ElementData> = document
                    .root_element()
                    .descendants()
                    .filter_map(scraper::ElementRef::wrap)
                    .filter(|el| el.value().name().eq_ignore_ascii_case(&tag_str))
                    .map(extract_element)
                    .collect();

                let json = serde_json::to_string(&elements).map_err(|e| {
                    JsNativeError::typ().with_message(format!("JSON: {e}"))
                })?;

                Ok(JsString::from(json).into())
            },
            context,
        )
    };

    // getElementById(html, id) → JSON string or null
    let gebi = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |html: JsString, id: JsString| -> JsResult<JsValue> {
                let html_str = html.to_std_string_escaped();
                let id_str = id.to_std_string_escaped();

                let document = Html::parse_document(&html_str);
                let found = document
                    .root_element()
                    .descendants()
                    .filter_map(scraper::ElementRef::wrap)
                    .find(|el| el.value().id() == Some(&id_str));

                match found {
                    Some(el) => {
                        let json = serde_json::to_string(&extract_element(el)).map_err(|e| {
                            JsNativeError::typ().with_message(format!("JSON: {e}"))
                        })?;
                        Ok(JsString::from(json).into())
                    }
                    None => Ok(JsValue::null()),
                }
            },
            context,
        )
    };

    let module = vec![
        (js_string!("querySelectorAll"), qsa),
        (js_string!("querySelector"), qs),
        (js_string!("getElementsByTagName"), gebtn),
        (js_string!("getElementById"), gebi),
    ]
    .into_js_module(context);

    let loader = context
        .downcast_module_loader::<MapModuleLoader>()
        .ok_or_else(|| "Module loader is not MapModuleLoader".to_string())?;

    loader.insert("dom", module);
    Ok(())
}
