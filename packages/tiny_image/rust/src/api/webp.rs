pub use std::path::{Path, PathBuf};

use image::{imageops, open, DynamicImage, GenericImageView};
use webp::{Encoder, WebPMemory};

use super::entity::Error;

pub fn parse_webp(path: String, output: String, quality: u8) -> Result<String, Error> {
    // 判断output为None的话，从path中去除文件名，然后加上后缀

    let filepath = PathBuf::from(path);
    let img = match open(filepath.clone()) {
        Ok(img) => img,
        Err(_) => return Err(Error::InputMissing(filepath)),
    };
    let (w, h) = img.dimensions();
    // Optionally, resize the existing photo and convert back into DynamicImage
    let size_factor = 1.0;
    let img: DynamicImage = DynamicImage::ImageRgba8(imageops::resize(
        &img,
        (w as f64 * size_factor) as u32,
        (h as f64 * size_factor) as u32,
        imageops::FilterType::Triangle,
    ));

    // Create the WebP encoder for the above image
    let encoder: Encoder = Encoder::from_image(&img).unwrap();
    // Encode the image at a specified quality 0-100
    let webp: WebPMemory = encoder.encode(quality as f32);
    // Define and write the WebP-encoded file to a given path
    let output_path = Path::new(&output).with_extension("webp");
    std::fs::write(&output_path, &*webp).unwrap();

    Ok(output_path.to_str().unwrap().to_string())
}
