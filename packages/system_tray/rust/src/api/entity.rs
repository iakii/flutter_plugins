
pub enum MySysTrayEventEnum {
    MENU,
    TRAY,
    NONE,
}

pub struct FFISysTrayEvent {
    pub event_type: MySysTrayEventEnum,
    pub menu_event_id: Option<String>,
    pub tray_event: Option<FFIIconEvent>,
}

impl FFISysTrayEvent {
    pub fn from_event(
        event_type: MySysTrayEventEnum,
        menu_event_id: Option<String>,
        tray_event: Option<FFIIconEvent>,
    ) -> Self {
        FFISysTrayEvent {
            event_type,
            menu_event_id,
            tray_event,
        }
    }
}

pub enum FFIIconEvent {
    /// A click happened on the tray icon.
    Click {
        /// Id of the tray icon which triggered this event.
        id: String,
        /// Physical Position of this event.
        position: FFIPhysicalPosition,
        /// Position and size of the tray icon.
        rect: FFIRect,
        /// Mouse button that triggered this event.
        button: FFIMouseButton,
        /// Mouse button state when this event was triggered.
        button_state: FFIMouseButtonState,
    },
    /// A double click happened on the tray icon. **Windows Only**
    DoubleClick {
        /// Id of the tray icon which triggered this event.
        id: String,
        /// Physical Position of this event.
        position: FFIPhysicalPosition,
        /// Position and size of the tray icon.
        rect: FFIRect,
        /// Mouse button that triggered this event.
        button: FFIMouseButton,
    },
    /// The mouse entered the tray icon region.
    Enter {
        /// Id of the tray icon which triggered this event.
        id: String,
        /// Physical Position of this event.
        position: FFIPhysicalPosition,
        /// Position and size of the tray icon.
        rect: FFIRect,
    },
    /// The mouse moved over the tray icon region.
    Move {
        /// Id of the tray icon which triggered this event.
        id: String,
        /// Physical Position of this event.
        position: FFIPhysicalPosition,
        /// Position and size of the tray icon.
        rect: FFIRect,
    },
    /// The mouse left the tray icon region.
    Leave {
        /// Id of the tray icon which triggered this event.
        id: String,
        /// Physical Position of this event.
        position: FFIPhysicalPosition,
        /// Position and size of the tray icon.
        rect: FFIRect,
    },
}

#[derive(Clone)]
pub struct FFIRect {
    pub size: FFIPhysicalSize,
    pub position: FFIPhysicalPosition,
}
#[derive(Clone)]
pub struct FFIPhysicalPosition  {
    pub x: f64,
    pub y: f64,
}
#[derive(Clone)]
pub struct FFIPhysicalSize  {
    pub width: u32,
    pub height: u32,
}

pub enum FFIMouseButton {
    Left,
    Right,
    Middle,
}

pub enum FFIMouseButtonState {
    Up,
    Down,
}
