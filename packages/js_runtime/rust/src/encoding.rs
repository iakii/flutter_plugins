//! Encoding 转码模块 —— 将字符编码转换能力注入到 JS 运行时。
//!
//! 通过 [register_encoding_module] 注册一个名为 `"encoding"` 的 synthetic module，
//! JS 端可通过 `await import('encoding')` 导入使用。
//!
//! ## JS API
//! ```js
//! const enc = await import('encoding');
//!
//! // decode: 将字节数组按指定编码解码为 UTF-8 字符串
//! const text = enc.decode([0xc4, 0xe3, 0xba, 0xc3], 'gbk'); // "你好"
//!
//! // encode: 将 UTF-8 字符串编码为指定编码的 JSON 数组
//! const bytes = JSON.parse(enc.encode('你好', 'gbk')); // [196, 227, 186, 195]
//!
//! // detect: BOM 检测编码（支持 UTF-8/UTF-16LE/UTF-16BE 的 BOM）
//! const encoding = enc.detect(bytes); // "UTF-8" | "UTF-16LE" | "UTF-16BE" | null
//!
//! // labels: 所有支持的编码名称
//! const names = JSON.parse(enc.labels()); // ["UTF-8", "GBK", "Big5", ...]
//! ```

use boa_engine::{
    js_string, Context, IntoJsModule, JsNativeError, JsResult, JsString, JsValue,
    module::MapModuleLoader, UnsafeIntoJsFunction,
};
use encoding_rs::Encoding;

/// 根据编码标签查找 Encoding（不区分大小写，支持别名）。
fn find_encoding(label: &str) -> Option<&'static Encoding> {
    Encoding::for_label(label.as_bytes())
}

pub fn register_encoding_module(context: &mut Context) -> Result<(), String> {
    // ─── decode(bytes: number[], fromEncoding: string) → string ──────────
    let decode_fn = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |bytes: Vec<u8>, encoding_name: JsString| -> JsResult<JsValue> {
                let label = encoding_name.to_std_string_escaped();
                let encoding = find_encoding(&label).ok_or_else(|| {
                    JsNativeError::typ()
                        .with_message(format!("Unsupported encoding: '{label}'"))
                })?;

                let (decoded, _actual_encoding, _had_errors) = encoding.decode(&bytes);
                Ok(JsString::from(decoded.into_owned()).into())
            },
            context,
        )
    };

    // ─── encode(text: string, toEncoding: string) → string (JSON array) ──
    let encode_fn = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |text: JsString, encoding_name: JsString| -> JsResult<JsValue> {
                let text_str = text.to_std_string_escaped();
                let label = encoding_name.to_std_string_escaped();
                let encoding = find_encoding(&label).ok_or_else(|| {
                    JsNativeError::typ()
                        .with_message(format!("Unsupported encoding: '{label}'"))
                })?;

                let (bytes, _actual_encoding, _had_errors) = encoding.encode(&text_str);

                // 返回 JSON 数组字符串（与 DOM 模块保持一致的惯例）
                let arr: Vec<serde_json::Value> = bytes
                    .iter()
                    .map(|&b| serde_json::Value::Number(b.into()))
                    .collect();
                let json = serde_json::to_string(&arr).map_err(|e| {
                    JsNativeError::typ().with_message(format!("JSON serialize: {e}"))
                })?;

                Ok(JsString::from(json).into())
            },
            context,
        )
    };

    // ─── detect(bytes: number[]) → string | null ─────────────────────────
    // 通过 BOM 检测编码，不支持 BOM 的编码返回 null。
    let detect_fn = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move |bytes: Vec<u8>| -> JsResult<JsValue> {
                if bytes.is_empty() {
                    return Ok(JsValue::null());
                }
                if let Some((encoding, _bom_len)) = Encoding::for_bom(&bytes) {
                    Ok(JsString::from(encoding.name()).into())
                } else {
                    Ok(JsValue::null())
                }
            },
            context,
        )
    };

    // ─── labels() → string (JSON array) ──────────────────────────────────
    let labels_fn = unsafe {
        UnsafeIntoJsFunction::into_js_function_unsafe(
            move || -> JsResult<JsValue> {
                // encoding_rs 支持的常用编码标签列表
                let all: &[&str] = &[
                    // Unicode
                    "UTF-8",
                    "UTF-16LE",
                    "UTF-16BE",
                    // 中文
                    "GBK",
                    "gb18030",
                    "Big5",
                    // 日文
                    "EUC-JP",
                    "ISO-2022-JP",
                    "Shift_JIS",
                    // 韩文
                    "EUC-KR",
                    // 西方
                    "windows-1252",
                    "ISO-8859-1",
                    "ISO-8859-15",
                    // 中欧
                    "windows-1250",
                    // 俄文
                    "windows-1251",
                    "KOI8-R",
                    "IBM866",
                ];
                let json = serde_json::to_string(&all).map_err(|e| {
                    JsNativeError::typ().with_message(format!("JSON serialize: {e}"))
                })?;
                Ok(JsString::from(json).into())
            },
            context,
        )
    };

    let module = vec![
        (js_string!("decode"), decode_fn),
        (js_string!("encode"), encode_fn),
        (js_string!("detect"), detect_fn),
        (js_string!("labels"), labels_fn),
    ]
    .into_js_module(context);

    let loader = context
        .downcast_module_loader::<MapModuleLoader>()
        .ok_or_else(|| "Module loader is not MapModuleLoader".to_string())?;

    loader.insert("encoding", module);
    Ok(())
}
