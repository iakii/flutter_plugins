use std::{
    fs::File,
    io::Write,
    path::{Path, PathBuf},
};

use image::ImageReader;
use mozjpeg::{Compress, ScanMode};

use super::entity::Error;

pub fn convert_to_jpeg(path: String, output: String, quality: u8) -> Result<String, Error> {
    let path = PathBuf::from(path);

    let reader = match ImageReader::open(path.clone()) {
        Ok(reader) => reader,
        Err(_) => return Err(Error::InputMissing(path)),
    };
    let image = reader.decode().unwrap();

    // let (width, height) = image.dimensions();
    let rgb_image = image.to_rgb8();

    let output_path = Path::new(&output).with_extension("jpg");

    let mut comp = Compress::new(mozjpeg::ColorSpace::JCS_RGB);

    comp.set_size(image.width() as usize, image.height() as usize);

    comp.set_quality(quality as f32); // 设置压缩质量 (0-100)

    comp.set_scan_optimization_mode(ScanMode::AllComponentsTogether);

    let mut comp = comp.start_compress(Vec::new())?;

    comp.write_scanlines(rgb_image.as_raw())?;

    let writer = comp.finish();

    let writer = match writer {
        Ok(writer) => writer,
        Err(_) => return Err(Error::DecodeError),
    };

    let mut output_file = File::create(output_path.clone())?;
    // 将压缩数据写入输出文件
    let result = output_file.write_all(&*writer);
    match result {
        Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
        Err(_) => Err(Error::EncodeFailed),
    }
}
