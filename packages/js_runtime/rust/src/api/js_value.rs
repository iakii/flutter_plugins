//! JsValue —— JavaScript 值的 FRB 兼容表示。
//!
//! 提供与 Boa 引擎 `JsValue` 的双向转换，以及类型判断和访问器方法。

use crate::api::js_error::JsError;
use boa_engine::{Context, JsValue as BoaValue, Source};
use boa_string::JsString;

/// JavaScript 值的 FRB 兼容枚举。
///
/// 使用 `Box<JsValue>` 包装递归类型（Array、Object），
/// 以确保 flutter_rust_bridge 能正确生成 Dart sealed class。
pub enum JsValue {
    /// `null` 或 `undefined`
    None,
    /// 布尔值
    Boolean(bool),
    /// 整数（i64，兼容 Dart int）
    Integer(i64),
    /// 浮点数
    Float(f64),
    /// BigInt，以字符串形式表示（含后缀 `n`，如 `"9007199254740993n"`）
    BigInt(String),
    /// 字符串
    String_(String),
    /// 二进制数据
    Bytes(Vec<u8>),
    /// 数组
    Array(Vec<Box<JsValue>>),
    /// 对象（键值对列表，FRB 兼容）。Dart 端可转为 `Map<String, JsValue>`。
    Object(Vec<(String, Box<JsValue>)>),
    /// Date，Unix 毫秒时间戳
    Date(i64),
    /// Symbol，描述字符串
    Symbol(String),
}

// ─── Clone（手动实现，因 Box<JsValue> 递归）────────────

impl Clone for JsValue {
    fn clone(&self) -> Self {
        match self {
            Self::None => Self::None,
            Self::Boolean(b) => Self::Boolean(*b),
            Self::Integer(i) => Self::Integer(*i),
            Self::Float(f) => Self::Float(*f),
            Self::BigInt(s) => Self::BigInt(s.clone()),
            Self::String_(s) => Self::String_(s.clone()),
            Self::Bytes(b) => Self::Bytes(b.clone()),
            Self::Array(arr) => Self::Array(arr.iter().map(|v| v.clone()).collect()),
            Self::Object(entries) => {
                Self::Object(entries.iter().map(|(k, v)| (k.clone(), v.clone())).collect())
            }
            Self::Date(ts) => Self::Date(*ts),
            Self::Symbol(s) => Self::Symbol(s.clone()),
        }
    }
}

// ─── 类型判断 ────────────────────────────────────────────

impl JsValue {
    /// 返回 JS 类型名称（如 `"number"`、`"string"`、`"object"` 等）。
    pub fn type_name(&self) -> String {
        match self {
            Self::None => "null",
            Self::Boolean(_) => "boolean",
            Self::Integer(_) | Self::Float(_) => "number",
            Self::BigInt(_) => "bigint",
            Self::String_(_) => "string",
            Self::Bytes(_) => "uint8array",
            Self::Array(_) => "array",
            Self::Object(_) => "object",
            Self::Date(_) => "date",
            Self::Symbol(_) => "symbol",
        }
        .to_string()
    }

    pub fn is_none(&self) -> bool {
        matches!(self, Self::None)
    }

    pub fn is_boolean(&self) -> bool {
        matches!(self, Self::Boolean(_))
    }

    pub fn is_number(&self) -> bool {
        matches!(self, Self::Integer(_) | Self::Float(_))
    }

    pub fn is_bigint(&self) -> bool {
        matches!(self, Self::BigInt(_))
    }

    pub fn is_string(&self) -> bool {
        matches!(self, Self::String_(_))
    }

    pub fn is_bytes(&self) -> bool {
        matches!(self, Self::Bytes(_))
    }

    pub fn is_array(&self) -> bool {
        matches!(self, Self::Array(_))
    }

    pub fn is_object(&self) -> bool {
        matches!(self, Self::Object(_))
    }

    pub fn is_date(&self) -> bool {
        matches!(self, Self::Date(_))
    }

    pub fn is_symbol(&self) -> bool {
        matches!(self, Self::Symbol(_))
    }

    pub fn is_primitive(&self) -> bool {
        matches!(
            self,
            Self::None
                | Self::Boolean(_)
                | Self::Integer(_)
                | Self::Float(_)
                | Self::BigInt(_)
                | Self::String_(_)
                | Self::Symbol(_)
        )
    }
}

// ─── 访问器 ──────────────────────────────────────────────

impl JsValue {
    pub fn as_boolean(&self) -> Option<bool> {
        match self {
            Self::Boolean(b) => Some(*b),
            _ => None,
        }
    }

    pub fn as_integer(&self) -> Option<i64> {
        match self {
            Self::Integer(i) => Some(*i),
            _ => None,
        }
    }

    pub fn as_float(&self) -> Option<f64> {
        match self {
            Self::Float(f) => Some(*f),
            _ => None,
        }
    }

    pub fn as_number(&self) -> Option<f64> {
        match self {
            Self::Integer(i) => Some(*i as f64),
            Self::Float(f) => Some(*f),
            _ => None,
        }
    }

    pub(crate) fn as_bigint(&self) -> Option<&str> {
        match self {
            Self::BigInt(s) => Some(s.as_str()),
            _ => None,
        }
    }

    pub(crate) fn as_string(&self) -> Option<&str> {
        match self {
            Self::String_(s) => Some(s.as_str()),
            _ => None,
        }
    }

    pub(crate) fn as_bytes(&self) -> Option<&[u8]> {
        match self {
            Self::Bytes(b) => Some(b.as_slice()),
            _ => None,
        }
    }

    pub(crate) fn as_array(&self) -> Option<&[Box<JsValue>]> {
        match self {
            Self::Array(arr) => Some(arr.as_slice()),
            _ => None,
        }
    }

    pub(crate) fn as_object(&self) -> Option<&[(String, Box<JsValue>)]> {
        match self {
            Self::Object(entries) => Some(entries.as_slice()),
            _ => None,
        }
    }

    pub fn as_date(&self) -> Option<i64> {
        match self {
            Self::Date(ts) => Some(*ts),
            _ => None,
        }
    }

    pub(crate) fn as_symbol(&self) -> Option<&str> {
        match self {
            Self::Symbol(s) => Some(s.as_str()),
            _ => None,
        }
    }
}

// ─── 便捷构造器 ──────────────────────────────────────────

impl JsValue {
    pub fn from_bool(b: bool) -> Self {
        Self::Boolean(b)
    }

    pub fn from_int(i: i64) -> Self {
        Self::Integer(i)
    }

    pub fn from_float(f: f64) -> Self {
        Self::Float(f)
    }

    pub fn from_string(s: String) -> Self {
        Self::String_(s)
    }

    pub fn from_str(s: &str) -> Self {
        Self::String_(s.to_string())
    }

    pub fn null() -> Self {
        Self::None
    }
}

// ─── Boa 互转（crate 内部使用）───────────────────────────

impl JsValue {
    /// 从 Boa 的 `JsValue` 转换。
    pub(crate) fn from_boa(value: &BoaValue, context: &mut Context) -> Self {
        if value.is_null_or_undefined() {
            return Self::None;
        }
        if let Some(b) = value.as_boolean() {
            return Self::Boolean(b);
        }
        // Boa 0.21: 数字统一通过 as_number() 获取
        if let Some(n) = value.as_number() {
            // 检查是否为整数（JavaScript 中 1.0 === 1）
            if n == (n as i64) as f64 && n.is_finite() {
                return Self::Integer(n as i64);
            }
            return Self::Float(n);
        }
        if let Some(s) = value.as_string() {
            return Self::String_(s.to_std_string_escaped());
        }
        if let Some(bi) = value.as_bigint() {
            return Self::BigInt(bi.to_string());
        }
        if let Some(sym) = value.as_symbol() {
            return Self::Symbol(sym.to_string());
        }
        if let Some(obj) = value.as_object() {
            if obj.is_array() {
                // 遍历数组索引
                let mut items: Vec<Box<JsValue>> = Vec::new();
                let mut i: u32 = 0;
                loop {
                    let item = obj.get(i, context).unwrap_or_default();
                    if item.is_null_or_undefined() {
                        // 检查是否真的存在该属性（还是数组越界）
                        if !obj.has_property(i, context).unwrap_or(false) {
                            break;
                        }
                    }
                    items.push(Box::new(Self::from_boa(&item, context)));
                    i += 1;
                    if i > 100_000 {
                        break; // 安全上限
                    }
                }
                return Self::Array(items);
            }

            // 普通对象：枚举自有属性
            let mut entries: Vec<(String, Box<JsValue>)> = Vec::new();
            if let Ok(keys) = obj.own_property_keys(context) {
                for key in keys {
                    // JsValue 实现了 Display，直接用 to_string()
                    let key_str = key.to_string();
                    if let Ok(val) = obj.get(key, context) {
                        entries.push((key_str, Box::new(Self::from_boa(&val, context))));
                    }
                }
            }
            return Self::Object(entries);
        }
        Self::None
    }

    /// 转换为 Boa 的 `JsValue`。
    pub(crate) fn to_boa(&self, context: &mut Context) -> Result<BoaValue, JsError> {
        match self {
            Self::None => Ok(BoaValue::null()),
            Self::Boolean(b) => Ok(BoaValue::new(*b)),
            Self::Integer(i) => Ok(BoaValue::new(*i as i32)),
            Self::Float(f) => Ok(BoaValue::rational(*f)),
            Self::BigInt(s) => {
                let code = format!("BigInt('{}')", s.trim().trim_end_matches('n'));
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create BigInt: {e}"),
                    })
            }
            Self::String_(s) => Ok(JsString::from(s.as_str()).into()),
            Self::Bytes(b) => {
                // 创建 Uint8Array
                let items: Vec<String> = b.iter().map(|byte| byte.to_string()).collect();
                let code = format!("new Uint8Array([{}])", items.join(","));
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create Uint8Array: {e}"),
                    })
            }
            Self::Array(items) => {
                let code = build_js_array_literal(items, context)?;
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create Array: {e}"),
                    })
            }
            Self::Object(entries) => {
                let code = build_js_object_literal(entries, context)?;
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create Object: {e}"),
                    })
            }
            Self::Date(ts) => {
                let code = format!("new Date({ts})");
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create Date: {e}"),
                    })
            }
            Self::Symbol(desc) => {
                let escaped = desc.replace('\\', "\\\\").replace('\'', "\\'");
                let code = format!("Symbol('{escaped}')");
                context
                    .eval(Source::from_bytes(code.as_bytes()))
                    .map_err(|e| JsError::Internal {
                        message: format!("Failed to create Symbol: {e}"),
                    })
            }
        }
    }

    /// 消耗 self 转换为 Boa 的 JsValue。
    pub(crate) fn into_boa(self, context: &mut Context) -> Result<BoaValue, JsError> {
        self.to_boa(context)
    }
}

// ─── 辅助函数 ────────────────────────────────────────────

/// 构建 JS 数组字面量字符串。
fn build_js_array_literal(
    items: &[Box<JsValue>],
    context: &mut Context,
) -> Result<String, JsError> {
    let mut parts = Vec::with_capacity(items.len());
    for item in items {
        parts.push(js_value_to_literal(item, context)?);
    }
    Ok(format!("[{}]", parts.join(",")))
}

/// 构建 JS 对象字面量字符串。
fn build_js_object_literal(
    entries: &[(String, Box<JsValue>)],
    context: &mut Context,
) -> Result<String, JsError> {
    let mut parts = Vec::with_capacity(entries.len());
    for (key, value) in entries {
        let val_str = js_value_to_literal(value, context)?;
        // 对 key 做简单的 JS 标识符检查
        if is_valid_js_identifier(key) {
            parts.push(format!("{key}: {val_str}"));
        } else {
            let escaped_key = key.replace('\\', "\\\\").replace('"', "\\\"");
            parts.push(format!("\"{escaped_key}\": {val_str}"));
        }
    }
    Ok(format!("{{{}}}", parts.join(",")))
}

/// 将 JsValue 转为 JS 字面量字符串（用于拼接 eval 代码）。
pub(crate) fn js_value_to_literal(value: &JsValue, context: &mut Context) -> Result<String, JsError> {
    match value {
        JsValue::None => Ok("null".to_string()),
        JsValue::Boolean(b) => Ok(b.to_string()),
        JsValue::Integer(i) => Ok(i.to_string()),
        JsValue::Float(f) => {
            if f.is_nan() {
                Ok("NaN".to_string())
            } else if f.is_infinite() {
                if f.is_sign_positive() {
                    Ok("Infinity".to_string())
                } else {
                    Ok("(-Infinity)".to_string())
                }
            } else {
                Ok(f.to_string())
            }
        }
        JsValue::BigInt(s) => Ok(s.clone()),
        JsValue::String_(s) => {
            // 用 JSON.stringify 确保正确转义
            let escaped = s.replace('\\', "\\\\").replace('"', "\\\"")
                .replace('\n', "\\n")
                .replace('\r', "\\r")
                .replace('\t', "\\t");
            Ok(format!("\"{escaped}\""))
        }
        JsValue::Bytes(_) => Ok("new Uint8Array([])".to_string()),
        JsValue::Array(items) => build_js_array_literal(items, context),
        JsValue::Object(entries) => build_js_object_literal(entries, context),
        JsValue::Date(ts) => Ok(format!("new Date({ts})")),
        JsValue::Symbol(desc) => {
            let escaped = desc.replace('\\', "\\\\").replace('\'', "\\'");
            Ok(format!("Symbol('{escaped}')"))
        }
    }
}

/// 检查字符串是否为合法的 JS 标识符。
fn is_valid_js_identifier(s: &str) -> bool {
    if s.is_empty() {
        return false;
    }
    let mut chars = s.chars();
    let first = chars.next().unwrap();
    if !first.is_ascii_alphabetic() && first != '_' && first != '$' {
        return false;
    }
    for c in chars {
        if !c.is_ascii_alphanumeric() && c != '_' && c != '$' {
            return false;
        }
    }
    true
}
