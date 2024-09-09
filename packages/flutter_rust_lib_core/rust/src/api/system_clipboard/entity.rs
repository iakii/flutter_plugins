use std::sync::mpsc::Sender;
use clipboard_rs::ClipboardHandler;
use serde::{Deserialize, Serialize};
use flutter_rust_bridge::frb;

pub struct Manager {
    sender: Sender<String>,
}

impl Manager {
    pub fn new(sender: Sender<String>) -> Self {
        Manager { sender }
    }
}

impl ClipboardHandler for Manager {
    fn on_clipboard_change(&mut self) {
        self.sender
            .send("clipboard_listener: clipboard has changed".to_string())
            .unwrap();
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct ClipImage {
    pub width: u32,
    pub height: u32,
    pub bytes: Vec<u8>,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub enum DataType {
    FILE,
    TEXT,
    IMAGE,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct ClipboardData {
    // 1 2 3 分别代表 1 图片 2 文字 3 文件
    pub data_type: DataType,
    pub content: Option<String>,
    pub image: Option<ClipImage>,
    pub paths: Option<Vec<String>>,
    pub icon: Option<String>,
    pub app_name: Option<String>,
}
