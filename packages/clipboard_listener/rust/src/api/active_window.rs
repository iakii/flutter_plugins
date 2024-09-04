use x_win::{get_active_window, get_open_windows, get_window_icon, IconInfo, WindowInfo};

/// Retrieves the active window.
///
/// Returns the active window as an `Option` type.
/// If the active window cannot be retrieved, `None` is returned.
///
/// # Example
///
/// ```
/// let active_window = get_active_window().unwrap();
/// ```
#[flutter_rust_bridge::frb(sync)]
pub fn get_current_active_window() -> WindowIconEntity {
    let active_window = get_active_window().unwrap();
    get_icon_to_win_icon_by_win(&active_window)
}

/// Retrieves a list of active windows and their corresponding icons.
///
/// This function uses the `get_open_windows` function to get a list of open windows.
/// It then iterates over the windows and uses the `get_icon_to_win_icon_by_win` function
/// to retrieve the icon for each window. The resulting list of `WindowIconEntity` structs
/// is collected and returned.
///
/// # Returns
///
/// A vector of `WindowIconEntity` structs representing the active windows and their icons.
///
/// # Panics
///
/// This function will panic if there is an error retrieving the open windows.
///
/// # Examples
///
/// ```rust
/// let active_window: Vec<WindowIconEntity> = get_active_windows();
/// ```
#[flutter_rust_bridge::frb(sync)]
pub fn get_all_open_windows() -> Vec<WindowIconEntity> {
    let active_window: Vec<WindowIconEntity> = get_open_windows()
        .unwrap()
        .iter()
        .map(|windows| get_icon_to_win_icon_by_win(windows))
        .collect();
    active_window
}

/// Retrieves the icon associated with the given window.
///
/// # Arguments
///
/// * `window` - The window for which to retrieve the icon.
///
/// # Returns
///
/// The icon associated with the window, or an error if the icon cannot be retrieved.
///
/// # Example
///
/// ```rust
/// let icon = get_window_icon(&window).unwrap();
/// ```
fn get_icon_to_win_icon_by_win(window: &WindowInfo) -> WindowIconEntity {
    let icon = get_window_icon(&window).unwrap();
    let win = window_info_to_entity(window);
    WindowIconEntity {
        window: win,
        icon: icon_info_to_entity(&icon),
    }
}

fn window_info_to_entity(window: &WindowInfo) -> WindowEntity {
    WindowEntity {
        id: window.id,
        title: window.title.clone(),
        position: PositionEntity {
            x: window.position.x,
            y: window.position.y,
            width: window.position.width,
            height: window.position.height,
            is_full_screen: window.position.is_full_screen,
        },
        info: InfoEntity {
            process_id: window.info.process_id,
            path: window.info.path.clone(),
            name: window.info.name.clone(),
            exec_name: window.info.exec_name.clone(),
        },
        url: window.url.clone(),
        usage: UsageEntity {
            memory: window.usage.memory,
        },
    }
}

fn icon_info_to_entity(icon: &IconInfo) -> IconEntity {
    IconEntity {
        data: icon.data.clone(),
        height: icon.height,
        width: icon.width,
    }
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_window_icon_by_window_id(id: u32) -> IconEntity {
    let active_window_list = get_open_windows().unwrap();

    let active_window = active_window_list
        .iter()
        .find(|window| window.id == id)
        .unwrap();

    let icon = get_window_icon(&active_window).unwrap();

    icon_info_to_entity(&icon)
}

pub struct WindowEntity {
    pub id: u32,
    pub title: String,
    pub position: PositionEntity,
    pub info: InfoEntity,
    pub usage: UsageEntity,
    pub url: String,
}

pub struct PositionEntity {
    pub x: i32,
    pub y: i32,
    pub width: i32,
    pub height: i32,
    pub is_full_screen: bool,
}

pub struct InfoEntity {
    pub process_id: u32,
    pub path: String,
    pub name: String,
    pub exec_name: String,
}

pub struct UsageEntity {
    pub memory: u32,
}

pub struct IconEntity {
    pub data: String,
    pub height: u32,
    pub width: u32,
}

pub struct WindowIconEntity {
    pub window: WindowEntity,
    pub icon: IconEntity,
}
