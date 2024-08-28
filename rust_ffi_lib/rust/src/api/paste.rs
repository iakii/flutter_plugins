use enigo::*;

pub fn paste() {
    let mut enigo = Enigo::new(&Settings::default()).unwrap();
    enigo.key(Key::Control, Direction::Press).unwrap();
    enigo.key(Key::Unicode('v'), Direction::Click).unwrap();
    enigo.key(Key::Control, Direction::Release).unwrap();
}

pub fn insert() {
    let mut enigo = Enigo::new(&Settings::default()).unwrap();
    enigo.key(Key::Shift, Direction::Press).unwrap();
    enigo.key(Key::Insert, Direction::Click).unwrap();
    enigo.key(Key::Shift, Direction::Release).unwrap();
}
