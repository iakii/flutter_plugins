use image::*;
use oxipng::{InFile, Options, OutFile};
use std::path::{Path, PathBuf};
use webp::*;

pub fn parse_webp(path: String, output: String, quality: f32) {
    let img = image::open(path).unwrap();
    let (w, h) = img.dimensions();
    // Optionally, resize the existing photo and convert back into DynamicImage
    let size_factor = 1.0;
    let img: DynamicImage = image::DynamicImage::ImageRgba8(imageops::resize(
        &img,
        (w as f64 * size_factor) as u32,
        (h as f64 * size_factor) as u32,
        imageops::FilterType::Triangle,
    ));

    // Create the WebP encoder for the above image
    let encoder: Encoder = Encoder::from_image(&img).unwrap();
    // Encode the image at a specified quality 0-100
    let webp: WebPMemory = encoder.encode(quality);
    // Define and write the WebP-encoded file to a given path
    let output_path = Path::new(&output).with_extension("webp");
    std::fs::write(&output_path, &*webp).unwrap();
}

/// 压缩png
pub fn parse_png(path: String, output: String, level: u8) {
    // 打开一个 PNG 图片文件
    let in_file = InFile::from(&Path::new(&path));

    // 创建一个 oxipng 的选项对象
    let options = Options::from_preset(level);
    // 输出目录
    let out_file = OutFile::from_path(PathBuf::from(&output).with_extension("png"));

    // 执行无损压缩
    oxipng::optimize(&in_file, &out_file, &options).unwrap();
}

/// 压缩jpg
#[allow(unused_variables)]
pub fn parse_jpg(path: String, output: String, quality: u8) {
    // let input_file = File::open(&Path::new(&path)).unwrap();
    // let decoder = JPEG::Decoder::new(input_file).unwrap();
    // let image = decoder.decode().unwrap();

    // let quality = quality; // 压缩质量，取值范围为 0 到 100
    // let output_file = File::create(&Path::new(&path)).unwrap();
    // image.save(output_file, quality).unwrap();
}

#[allow(unused_variables)]
pub fn compress_image(path: String, quality: u8) {
    let path = &Path::new(&path);

    let ext = path.extension().unwrap().to_str().unwrap();
    let filename = path.file_stem().unwrap().to_str().unwrap();
    // let result = format!("{}{}", str1, str2);
    let output = path
        .parent()
        .unwrap()
        .join(format!("{}{}{}", filename, "_w.", ext));

    let reader = ImageReader::open(path).unwrap();
    // 获取图片的格式

    let format = reader.format().unwrap();

    let result = match format {
        ImageFormat::Png => {
            println!("Image format: PNG");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Jpeg => {
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::WebP => {
            println!("Image format: WEBP");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Gif => {
            println!("Image format: GIF");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Bmp => {
            println!("Image format: BMP");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Ico => {
            println!("Image format: ICO");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Tiff => {
            println!("Image format: TIFF");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Tga => {
            println!("Image format: TGA");
            let var_name = output.to_str().unwrap();
            var_name
        }
        ImageFormat::Pnm => todo!(),
        ImageFormat::Dds => todo!(),
        ImageFormat::Hdr => todo!(),
        ImageFormat::OpenExr => todo!(),
        ImageFormat::Farbfeld => todo!(),
        ImageFormat::Avif => todo!(),
        ImageFormat::Qoi => todo!(),
        _ => todo!(), // _ => Err(()),
    };

    // result
}
