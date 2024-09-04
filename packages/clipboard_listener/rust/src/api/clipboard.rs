use std::{
    sync::mpsc::{self, Sender},
    thread,
};

use clipboard_rs::{
    common::RustImage, Clipboard, ClipboardContext, ClipboardHandler, ClipboardWatcher,
    ClipboardWatcherContext, RustImageData,
};
use flutter_rust_bridge::DartFnFuture;

use x_win::{get_active_window, get_window_icon};

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(sync)]
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub async fn clipboard_listener_start(_dart_callback: impl Fn(String) -> DartFnFuture<String>) {
    // 创建一个消息通道, 返回一个元组：(发送者，接收者)
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let _ = ClipboardWatcherContext::new()
            .unwrap()
            .add_handler(Manager::new(tx))
            .start_watch();
        println!("start watch!");
    });

    for received in rx {
        let _ = _dart_callback(received).await;
    }
}

#[flutter_rust_bridge::frb(sync)]
pub fn set_clipboard_data(data: ClipboardData) {
    let ctx = ClipboardContext::new().unwrap();
    //  1 图片 2 文字 3 文件
    match data.data_type {
        DataType::IMAGE => {
            let img = RustImageData::from_bytes(&data.image.unwrap().bytes).unwrap();
            ctx.set_image(img).unwrap();
        }
        DataType::TEXT => {
            ctx.set_text(data.content.unwrap()).unwrap();
        }
        DataType::FILE => {
            ctx.set_files(data.paths.unwrap()).unwrap();
        }
    }
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_clipboard_data() -> ClipboardData {
    let active_window = get_active_window().unwrap();
    let icon = get_window_icon(&active_window).unwrap();

    let ctx = ClipboardContext::new().unwrap();
    let img = ctx.get_image();
    let clipboard_data = match img {
        Ok(img) => {
            let size = img.get_size();
            let clipboard_data = ClipboardData {
                data_type: DataType::IMAGE,
                image: Some(CPImage {
                    width: size.0,
                    height: size.1,
                    bytes: img.to_png().unwrap().get_bytes().to_vec(),
                }),
                paths: None,
                content: None,
                app_name: None,
                icon: None,
            };

            clipboard_data
        }
        Err(err) => {
            println!("err={}", err);

            let files = ctx.get_files();

            match files {
                Ok(files) => {
                    let clipboard_data = ClipboardData {
                        data_type: DataType::FILE,
                        image: None,
                        paths: Some(files),
                        content: None,
                        app_name: None,
                        icon: None,
                    };

                    clipboard_data
                }
                Err(_) => {
                    let text = ctx.get_text();

                    match text {
                        Ok(text) => {
                            let clipboard_data = ClipboardData {
                                data_type: DataType::TEXT,
                                image: None,
                                paths: None,
                                content: Some(text),
                                app_name: None,
                                icon: None,
                            };

                            clipboard_data
                        }
                        Err(_) => ClipboardData {
                            data_type: DataType::TEXT,
                            image: None,
                            paths: None,
                            content: None,
                            app_name: None,
                            icon: None,
                        },
                    }
                }
            }
        }
    };

    let mut clipboard_data = clipboard_data;
    clipboard_data.app_name = Some(active_window.info.name);
    clipboard_data.icon = Some(icon.data);

    clipboard_data
}

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

pub struct CPImage {
    pub width: u32,
    pub height: u32,
    pub bytes: Vec<u8>,
}

pub enum DataType {
    FILE,
    TEXT,
    IMAGE,
}

pub struct ClipboardData {
    // 1 2 3 分别代表 1 图片 2 文字 3 文件
    pub data_type: DataType,
    pub content: Option<String>,
    pub image: Option<CPImage>,
    pub paths: Option<Vec<String>>,
    pub icon: Option<String>,
    pub app_name: Option<String>,
}
