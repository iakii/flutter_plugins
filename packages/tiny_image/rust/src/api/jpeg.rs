// use std::{
//     fs::File,
//     io::Write,
//     path::{Path, PathBuf},
// };

// use image::ImageReader;
// use mozjpeg::{Compress, ScanMode};

// use super::icon::error::Error;

// pub fn convert_to_jpeg(path: String, output: String, quality: u8) -> Result<String, Error> {
//     let path = PathBuf::from(path);

//     let reader = match ImageReader::open(path.clone()) {
//         Ok(reader) => reader,
//         Err(_) => return Err(Error::InputMissing(path)),
//     };
//     let img = reader.decode().unwrap().to_rgb8();
//     let output_path = Path::new(&output).with_extension("jpg");

//     let mut comp = Compress::new(mozjpeg::ColorSpace::JCS_RGB);

//     comp.set_size(img.width() as usize, img.height() as usize);
//     comp.set_scan_optimization_mode(ScanMode::Auto);
//     comp.set_quality(quality as f32); // 设置压缩质量 (0-100)

//     let comp = comp.start_compress(Vec::new()).unwrap(); // any io::Write will work
//     let writer = comp.finish().unwrap();
//     let mut output_file = File::create(output_path.clone()).unwrap();
//     let result = output_file.write_all(&*writer);
//     match result {
//         Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
//         Err(_) => Err(Error::EncodeFailed),
//     }
// }
