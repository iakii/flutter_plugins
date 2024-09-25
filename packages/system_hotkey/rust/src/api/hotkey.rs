use flutter_rust_bridge::DartFnFuture;
use rdev::{listen, stop_listen, EventType};
use std::sync::mpsc::{self, Receiver, Sender};
use std::thread;

pub async fn middle_button_click_listener(dart_callback: impl Fn(String) -> DartFnFuture<String>) {
    let (tx, rx): (Sender<()>, Receiver<()>) = mpsc::channel();

    thread::spawn(move || {
        listen(move |event: rdev::Event| {
         
            if event.event_type == EventType::ButtonPress(rdev::Button::Middle) {
                tx.send(()).unwrap();
            }

            let key = match event.event_type {
                EventType::KeyPress(key) => key,
                EventType::KeyRelease(key) => key,
                _ => return,
            };

            println!("Key pressed: {:?}", event.event_type);
        })
        .unwrap();
    });

    for _ in rx {
        let _ = dart_callback("hello".to_string()).await;
    }

    print!("middle_button_click_listener stopped");
}

pub fn stop_listener() {
    stop_listen();
}
