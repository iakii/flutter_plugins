use serde::{Deserialize, Serialize};
use flutter_rust_bridge::frb;

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct WindowEntity {
    pub id: u32,
    pub title: String,
    pub position: PositionEntity,
    pub info: InfoEntity,
    pub usage: UsageEntity,
    pub url: String,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct PositionEntity {
    pub x: i32,
    pub y: i32,
    pub width: i32,
    pub height: i32,
    pub is_full_screen: bool,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct InfoEntity {
    pub process_id: u32,
    pub path: String,
    pub name: String,
    pub exec_name: String,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct UsageEntity {
    pub memory: u32,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct IconEntity {
    pub data: String,
    pub height: u32,
    pub width: u32,
}

#[derive(Serialize, Deserialize, Debug)]
#[frb(dart_metadata=("freezed", "immutable"))]
pub struct WindowIconEntity {
    pub window: WindowEntity,
    pub icon: IconEntity,
}
