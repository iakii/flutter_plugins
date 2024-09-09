#![allow(unused)]

use tray_icon::{
    dpi::PhysicalPosition,
    menu::{AboutMetadata, Menu, MenuEvent, MenuItem, PredefinedMenuItem},
    MouseButton, MouseButtonState, Rect, TrayIcon, TrayIconBuilder, TrayIconEvent,
};
use winit::event_loop::{ControlFlow, EventLoopBuilder};

use crate::frb_generated::StreamSink;

use super::entity::{FFIIconEvent, FFISysTrayEvent, MySysTrayEventEnum};

// pub fn builder(path: String, sink: StreamSink<FFISysTrayEvent>) {
//     // let path = concat!(env!("CARGO_MANIFEST_DIR"), "/icons/icon.png");

//     let tray_menu = Menu::new();

//     let quit_i = MenuItem::new("Quit", true, None);
//     tray_menu.append_items(&[
//         &PredefinedMenuItem::about(
//             None,
//             Some(AboutMetadata {
//                 name: Some("tao".to_string()),
//                 copyright: Some("Copyright tao".to_string()),
//                 ..Default::default()
//             }),
//         ),
//         &PredefinedMenuItem::separator(),
//         &quit_i,
//     ]);

//     // Since winit doesn't use gtk on Linux, and we need gtk for
//     // the tray icon to show up, we need to spawn a thread
//     // where we initialize gtk and create the tray_icon
//     #[cfg(target_os = "linux")]
//     std::thread::spawn(|| {
//         use tray_icon::menu::Menu;

//         let icon = load_icon(std::path::Path::new(path));

//         gtk::init().unwrap();
//         let _tray_icon = TrayIconBuilder::new()
//             .with_menu(Box::new(tray_menu.clone()))
//             .with_icon(icon)
//             .build()
//             .unwrap();

//         gtk::main();
//     });

//     let event_loop: winit::event_loop::EventLoop<()> = EventLoopBuilder::new().build().unwrap();

//     #[cfg(not(target_os = "linux"))]
//     let mut tray_icon: Option<TrayIcon> = None;

//     let menu_channel = MenuEvent::receiver();
//     let tray_channel = TrayIconEvent::receiver();

//     event_loop.run(move |event, event_loop| {
//         // We add delay of 16 ms (60fps) to event_loop to reduce cpu load.
//         // This can be removed to allow ControlFlow::Poll to poll on each cpu cycle
//         // Alternatively, you can set ControlFlow::Wait or use TrayIconEvent::set_event_handler,
//         // see https://github.com/tauri-apps/tray-icon/issues/83#issuecomment-1697773065
//         event_loop.set_control_flow(ControlFlow::WaitUntil(
//             std::time::Instant::now() + std::time::Duration::from_millis(16),
//         ));

//         #[cfg(not(target_os = "linux"))]
//         if let winit::event::Event::NewEvents(winit::event::StartCause::Init) = event {
//             let icon = load_icon(std::path::Path::new(&path));

//             // We create the icon once the event loop is actually running
//             // to prevent issues like https://github.com/tauri-apps/tray-icon/issues/90
//             tray_icon = Some(
//                 TrayIconBuilder::new()
//                     .with_menu(Box::new(tray_menu.clone()))
//                     .with_tooltip("winit - awesome windowing lib")
//                     .with_icon(icon)
//                     .with_title("x")
//                     .build()
//                     .unwrap(),
//             );
//             // We have to request a redraw here to have the icon actually show up.
//             // Winit only exposes a redraw method on the Window so we use core-foundation directly.
//             #[cfg(target_os = "macos")]
//             unsafe {
//                 use core_foundation::runloop::{CFRunLoopGetMain, CFRunLoopWakeUp};
//                 let rl = CFRunLoopGetMain();
//                 CFRunLoopWakeUp(rl);
//             }
//         }

//         if let Ok(event) = tray_channel.try_recv() {
//             let mut sys_tray_event: FFISysTrayEvent = tray_icon_event_to_my_event(event);
//             let _ = sink.add(sys_tray_event);
//         }
//         if let Ok(event) = menu_channel.try_recv() {
//             let mut sys_tray_event =
//                 FFISysTrayEvent::from_event(MySysTrayEventEnum::MENU, Some(event.id.0), None);

//             let _ = sink.add(sys_tray_event);
//         }
//     });
// }

fn load_icon(path: &std::path::Path) -> tray_icon::Icon {
    let (icon_rgba, icon_width, icon_height) = {
        let image = image::open(path)
            .expect("Failed to open icon path")
            .into_rgba8();
        let (width, height) = image.dimensions();
        let rgba: Vec<u8> = image.into_raw();
        (rgba, width, height)
    };
    tray_icon::Icon::from_rgba(icon_rgba, icon_width, icon_height).expect("Failed to open icon")
}

fn tray_icon_event_to_my_event(event: TrayIconEvent) -> FFISysTrayEvent {
    match event {
        TrayIconEvent::Click {
            id,
            position,
            rect,
            button,
            button_state,
        } => FFISysTrayEvent::from_event(
            MySysTrayEventEnum::TRAY,
            None,
            Some(FFIIconEvent::Click {
                id: id.0,
                position: position_2_my_position(position),
                rect: rect_2_my_rect(rect),
                button: button_2_my_button(button),
                button_state: match button_state {
                    MouseButtonState::Down => super::entity::FFIMouseButtonState::Down,
                    MouseButtonState::Up => super::entity::FFIMouseButtonState::Up,
                },
            }),
        ),
        TrayIconEvent::DoubleClick {
            id,
            position,
            rect,
            button,
        } => FFISysTrayEvent::from_event(
            MySysTrayEventEnum::TRAY,
            None,
            Some(FFIIconEvent::DoubleClick {
                id: id.0,
                position: position_2_my_position(position),
                rect: rect_2_my_rect(rect),
                button: button_2_my_button(button),
            }),
        ),
        TrayIconEvent::Enter { id, position, rect } => FFISysTrayEvent::from_event(
            MySysTrayEventEnum::TRAY,
            None,
            Some(FFIIconEvent::Enter {
                id: id.0,
                position: position_2_my_position(position),
                rect: rect_2_my_rect(rect),
            }),
        ),
        TrayIconEvent::Leave { id, position, rect } => FFISysTrayEvent::from_event(
            MySysTrayEventEnum::TRAY,
            None,
            Some(FFIIconEvent::Leave {
                id: id.0,
                position: position_2_my_position(position),
                rect: rect_2_my_rect(rect),
            }),
        ),
        TrayIconEvent::Move { id, position, rect } => FFISysTrayEvent::from_event(
            MySysTrayEventEnum::TRAY,
            None,
            Some(FFIIconEvent::Move {
                id: id.0,
                position: position_2_my_position(position),
                rect: rect_2_my_rect(rect),
            }),
        ),
        _ => FFISysTrayEvent::from_event(MySysTrayEventEnum::NONE, None, None),
    }
}

fn position_2_my_position(position: PhysicalPosition<f64>) -> super::entity::FFIPhysicalPosition {
    super::entity::FFIPhysicalPosition {
        x: position.x,
        y: position.y,
    }
}

fn rect_2_my_rect(rect: Rect) -> super::entity::FFIRect {
    super::entity::FFIRect {
        size: super::entity::FFIPhysicalSize {
            width: rect.size.width,
            height: rect.size.height,
        },
        position: super::entity::FFIPhysicalPosition {
            x: rect.position.x,
            y: rect.position.y,
        },
    }
}

fn button_2_my_button(button: MouseButton) -> super::entity::FFIMouseButton {
    match button {
        MouseButton::Left => super::entity::FFIMouseButton::Left,
        MouseButton::Right => super::entity::FFIMouseButton::Right,
        MouseButton::Middle => super::entity::FFIMouseButton::Middle,
    }
}
