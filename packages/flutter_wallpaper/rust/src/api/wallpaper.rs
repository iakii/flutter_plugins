use flutter_rust_bridge::frb;
use wallpape_rs as wallpaper;

#[frb(sync)]
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}


#[frb(sync)]
pub fn set_from_path(path: &str, mode: Option<wallpaper::Mode>) {
    println!("{:?}", wallpaper::get());
    // Sets the wallpaper for the current desktop from a file path.
    wallpaper::set_from_path(path).unwrap();
    // Sets the wallpaper style.
    if let Some(mode) = mode {
        wallpaper::set_mode(mode).unwrap();
    } else {
        wallpaper::set_mode(wallpaper::Mode::Crop).unwrap();
    }
    println!("{:?}", wallpaper::get());
}


#[frb(mirror(wallpaper::Mode))]
pub enum Mode {
    Center,
    Crop,
    Fit,
    Span,
    Stretch,
    Tile,
}