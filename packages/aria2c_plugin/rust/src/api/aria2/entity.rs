pub use std::collections::BTreeMap;
use flutter_rust_bridge::frb;
pub use serde_json::{Map, Number, Value};

#[frb(mirror(TaskOptions))]
pub struct TaskOptionsMirror {
    pub header: Option<Vec<String>>,

    pub split: Option<i32>,

    pub all_proxy: Option<String>,

    pub dir: Option<String>,

    pub out: Option<String>,

    pub gid: Option<String>,

    pub auto_file_renaming: Option<bool>,

    pub check_integrity: Option<bool>,

    pub lowest_speed_limit: Option<String>,

    pub max_download_limit: Option<String>,

    pub max_connection_per_server: Option<i32>,

    pub max_tries: Option<i32>,

    pub timeout: Option<i32>,

    pub extra_options: Map<String, Value>,

    // #[frb(name = "isContinue")]
    // #[frb(name = "dartFieldName")]
    // pub r#continue: Option<bool>,
}

#[frb(mirror(Value))]
pub enum ValueMirror {
    Null,

    Bool(bool),

    Number(Number),

    String(String),

    Array(Vec<Value>),

    Object(Map<String, Value>),
}

#[frb(mirror(Map))]
pub struct MapMirror<K, V> {
    map: MapImpl<K, V>,
}


type MapImpl<K, V> = BTreeMap<K, V>;