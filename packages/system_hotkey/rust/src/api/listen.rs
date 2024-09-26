use crate::frb_generated::StreamSink;
use rdev::{listen, Button, EventType, Key};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{mpsc, Arc};
use std::thread;

pub struct ShortcutListener {
    cancel_flag: Arc<AtomicBool>,
    // shortcuts: Arc<Mutex<HashMap<String, fn(String)>>>, // 存储组合键与回调
}

impl ShortcutListener {
    pub fn new() -> Self {
        Self {
            cancel_flag: Arc::new(AtomicBool::new(false)),
        }
    }

    pub fn start_listener(&self, stream_sink: StreamSink<RawEventType>) {
        let cancel_flag = Arc::clone(&self.cancel_flag);
        let (tx, rx) = mpsc::channel();

        thread::spawn(move || {
            listen(move |event| {
                let raw_event = RawEventType::from(event.event_type);
                tx.send(raw_event).unwrap();
            })
            .unwrap();
        });

        while let Ok(rev) = rx.recv() {
            if cancel_flag.load(Ordering::Relaxed) {
                println!("Cancel flag detected, terminating listener.");
                break; // 停止监听
            }
            stream_sink.add(rev).unwrap();
        }
        println!("Listener stopped.");
    }

    pub fn unregister_all_hotkeys(&self) {
        self.stop_listener();
    }

    pub fn stop_listener(&self) {
        // 设置取消标志
        self.cancel_flag.store(true, Ordering::Relaxed);
        rdev::stop_listen();
    }
}

pub fn start_listener() -> ShortcutListener {
    let listener = ShortcutListener::new();
    listener
}

// 需要将rdev的Event转化成字符串形式的按键，然后根据按键查找对应的回调函数并执行
// 由于rdev库的Event类型并没有提供按键的字符串表示，所以需要自己实现这个功能
// 通过查看rdev库的源码，发现Event类型中的event_type字段是EventType枚举类型，EventType枚举类型中有KeyPress类型

fn rdev_key2_raw_key(key: Key) -> RawKey {
    match key {
        Key::Alt => RawKey::Alt,
        Key::AltGr => RawKey::AltGr,
        Key::Backspace => RawKey::Backspace,
        Key::CapsLock => RawKey::CapsLock,
        Key::ControlLeft => RawKey::ControlLeft,
        Key::ControlRight => RawKey::ControlRight,
        Key::Delete => RawKey::Delete,
        Key::DownArrow => RawKey::DownArrow,
        Key::End => RawKey::End,
        Key::Escape => RawKey::Escape,
        Key::F1 => RawKey::F1,
        Key::F10 => RawKey::F10,
        Key::F11 => RawKey::F11,
        Key::F12 => RawKey::F12,
        Key::F2 => RawKey::F2,
        Key::F3 => RawKey::F3,
        Key::F4 => RawKey::F4,
        Key::F5 => RawKey::F5,
        Key::F6 => RawKey::F6,
        Key::F7 => RawKey::F7,
        Key::F8 => RawKey::F8,
        Key::F9 => RawKey::F9,
        Key::Home => RawKey::Home,
        Key::LeftArrow => RawKey::LeftArrow,
        Key::MetaLeft => RawKey::MetaLeft,
        Key::MetaRight => RawKey::MetaRight,
        Key::PageDown => RawKey::PageDown,
        Key::PageUp => RawKey::PageUp,
        Key::Return => RawKey::Return,
        Key::RightArrow => RawKey::RightArrow,
        Key::ShiftLeft => RawKey::ShiftLeft,
        Key::ShiftRight => RawKey::ShiftRight,
        Key::Space => RawKey::Space,
        Key::Tab => RawKey::Tab,
        Key::UpArrow => RawKey::UpArrow,
        Key::PrintScreen => RawKey::PrintScreen,
        Key::ScrollLock => RawKey::ScrollLock,
        Key::Pause => RawKey::Pause,
        Key::NumLock => RawKey::NumLock,
        Key::BackQuote => RawKey::BackQuote,
        Key::Num1 => RawKey::Num1,
        Key::Num2 => RawKey::Num2,
        Key::Num3 => RawKey::Num3,
        Key::Num4 => RawKey::Num4,
        Key::Num5 => RawKey::Num5,
        Key::Num6 => RawKey::Num6,
        Key::Num7 => RawKey::Num7,
        Key::Num8 => RawKey::Num8,
        Key::Num9 => RawKey::Num9,
        Key::Num0 => RawKey::Num0,
        Key::Minus => RawKey::Minus,
        Key::Equal => RawKey::Equal,
        Key::KeyQ => RawKey::KeyQ,
        Key::KeyW => RawKey::KeyW,
        Key::KeyE => RawKey::KeyE,
        Key::KeyR => RawKey::KeyR,
        Key::KeyT => RawKey::KeyT,
        Key::KeyY => RawKey::KeyY,
        Key::KeyU => RawKey::KeyU,
        Key::KeyI => RawKey::KeyI,
        Key::KeyO => RawKey::KeyO,
        Key::KeyP => RawKey::KeyP,
        Key::LeftBracket => RawKey::LeftBracket,
        Key::RightBracket => RawKey::RightBracket,
        Key::KeyA => RawKey::KeyA,
        Key::KeyS => RawKey::KeyS,
        Key::KeyD => RawKey::KeyD,
        Key::KeyF => RawKey::KeyF,
        Key::KeyG => RawKey::KeyG,
        Key::KeyH => RawKey::KeyH,
        Key::KeyJ => RawKey::KeyJ,
        Key::KeyK => RawKey::KeyK,
        Key::KeyL => RawKey::KeyL,
        Key::SemiColon => RawKey::SemiColon,
        Key::Quote => RawKey::Quote,
        Key::BackSlash => RawKey::BackSlash,
        Key::IntlBackslash => RawKey::IntlBackslash,
        Key::KeyZ => RawKey::KeyZ,
        Key::KeyX => RawKey::KeyX,
        Key::KeyC => RawKey::KeyC,
        Key::KeyV => RawKey::KeyV,
        Key::KeyB => RawKey::KeyB,
        Key::KeyN => RawKey::KeyN,
        Key::KeyM => RawKey::KeyM,
        Key::Comma => RawKey::Comma,
        Key::Dot => RawKey::Dot,
        Key::Slash => RawKey::Slash,
        Key::Insert => RawKey::Insert,
        Key::KpReturn => RawKey::KpReturn,
        Key::KpMinus => RawKey::KpMinus,
        Key::KpPlus => RawKey::KpPlus,
        Key::KpMultiply => RawKey::KpMultiply,
        Key::KpDivide => RawKey::KpDivide,
        Key::Kp0 => RawKey::Kp0,
        Key::Kp1 => RawKey::Kp1,
        Key::Kp2 => RawKey::Kp2,
        Key::Kp3 => RawKey::Kp3,
        Key::Kp4 => RawKey::Kp4,
        Key::Kp5 => RawKey::Kp5,
        Key::Kp6 => RawKey::Kp6,
        Key::Kp7 => RawKey::Kp7,
        Key::Kp8 => RawKey::Kp8,
        Key::Kp9 => RawKey::Kp9,
        Key::KpDelete => RawKey::KpDelete,
        Key::Function => RawKey::Function,
        Key::Unknown(u32) => RawKey::Unknown(u32),
    }
}
#[derive(Debug, Copy, Clone, PartialEq, Eq, Hash)]
pub enum RawKey {
    /// Alt key on Linux and Windows (option key on macOS)
    Alt,
    AltGr,
    Backspace,
    CapsLock,
    ControlLeft,
    ControlRight,
    Delete,
    DownArrow,
    End,
    Escape,
    F1,
    F10,
    F11,
    F12,
    F2,
    F3,
    F4,
    F5,
    F6,
    F7,
    F8,
    F9,
    Home,
    LeftArrow,
    /// also known as "windows", "super", and "command"
    MetaLeft,
    /// also known as "windows", "super", and "command"
    MetaRight,
    PageDown,
    PageUp,
    Return,
    RightArrow,
    ShiftLeft,
    ShiftRight,
    Space,
    Tab,
    UpArrow,
    PrintScreen,
    ScrollLock,
    Pause,
    NumLock,
    BackQuote,
    Num1,
    Num2,
    Num3,
    Num4,
    Num5,
    Num6,
    Num7,
    Num8,
    Num9,
    Num0,
    Minus,
    Equal,
    KeyQ,
    KeyW,
    KeyE,
    KeyR,
    KeyT,
    KeyY,
    KeyU,
    KeyI,
    KeyO,
    KeyP,
    LeftBracket,
    RightBracket,
    KeyA,
    KeyS,
    KeyD,
    KeyF,
    KeyG,
    KeyH,
    KeyJ,
    KeyK,
    KeyL,
    SemiColon,
    Quote,
    BackSlash,
    IntlBackslash,
    KeyZ,
    KeyX,
    KeyC,
    KeyV,
    KeyB,
    KeyN,
    KeyM,
    Comma,
    Dot,
    Slash,
    Insert,
    KpReturn,
    KpMinus,
    KpPlus,
    KpMultiply,
    KpDivide,
    Kp0,
    Kp1,
    Kp2,
    Kp3,
    Kp4,
    Kp5,
    Kp6,
    Kp7,
    Kp8,
    Kp9,
    KpDelete,
    Function,
    Unknown(u32),
}

#[derive(Debug, Copy, Clone, PartialEq, Eq, Hash)]
pub enum RawButton {
    Left,
    Right,
    Middle,
    Unknown(u8),
}

fn rdev_button2_raw_button(button: Button) -> RawButton {
    match button {
        Button::Left => RawButton::Left,
        Button::Right => RawButton::Right,
        Button::Middle => RawButton::Middle,
        Button::Unknown(u8) => RawButton::Unknown(u8),
    }
}
#[derive(Debug, Copy, Clone, PartialEq)]
pub enum RawEventType {
    /// The keys correspond to a standard qwerty layout, they don't correspond
    /// To the actual letter a user would use, that requires some layout logic to be added.
    KeyPress(RawKey),
    KeyRelease(RawKey),
    /// Mouse Button
    ButtonPress(RawButton),
    ButtonRelease(RawButton),
    /// Values in pixels. `EventType::MouseMove{x: 0, y: 0}` corresponds to the
    /// top left corner, with x increasing downward and y increasing rightward
    MouseMove {
        x: f64,
        y: f64,
    },
    /// `delta_y` represents vertical scroll and `delta_x` represents horizontal scroll.
    /// Positive values correspond to scrolling up or right and negative values
    /// correspond to scrolling down or left
    Wheel {
        delta_x: i64,
        delta_y: i64,
    },
}

impl RawEventType {
    fn from(event_type: EventType) -> Self {
        match event_type {
            EventType::KeyPress(key) => RawEventType::KeyPress(rdev_key2_raw_key(key)),
            EventType::KeyRelease(key) => RawEventType::KeyRelease(rdev_key2_raw_key(key)),
            EventType::ButtonPress(button) => {
                RawEventType::ButtonPress(rdev_button2_raw_button(button))
            }
            EventType::ButtonRelease(button) => {
                RawEventType::ButtonRelease(rdev_button2_raw_button(button))
            }
            EventType::MouseMove { x, y } => RawEventType::MouseMove { x, y },
            EventType::Wheel { delta_x, delta_y } => RawEventType::Wheel { delta_x, delta_y },
        }
    }
}
