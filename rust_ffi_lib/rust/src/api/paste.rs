use std::env;

#[cfg(not(target_os = "macos"))]
use enigo::{Direction, Enigo, Key, Keyboard, Settings};

#[cfg(not(target_os = "macos"))]
#[flutter_rust_bridge::frb(sync)]
pub fn paste() {
    let mut enigo = Enigo::new(&Settings::default()).unwrap();

    let control_or_command = if cfg!(target_os = "macos") {
        Key::Meta
    } else {
        Key::Control
    };
    enigo.key(control_or_command, Direction::Press).unwrap();
    enigo.key(Key::Unicode('v'), Direction::Click).unwrap();
    enigo.key(control_or_command, Direction::Release).unwrap();
}

#[cfg(not(target_os = "macos"))]
#[flutter_rust_bridge::frb(sync)]
pub fn insert() {
    let target_os = env::var("CARGO_CFG_TARGET_OS").unwrap();
    println!("target_os: {}", target_os);
}

#[cfg(target_os = "macos")]
#[flutter_rust_bridge::frb(sync)]
pub fn insert() {
    let target_os = env::var("CARGO_CFG_TARGET_OS").unwrap();
    println!("target_os: {}", target_os);
}

#[cfg(target_os = "macos")]
#[flutter_rust_bridge::frb(sync)]
pub fn paste() {
    let target_os = env::var("CARGO_CFG_TARGET_OS").unwrap();
    println!("target_os: {}", target_os);
}
