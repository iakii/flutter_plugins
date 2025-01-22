use image::{imageops::FilterType, open, ImageFormat};
use std::{fs::File, io::BufWriter, path::PathBuf};

use super::icon::error::Error;

pub fn convert_png_to_ico(
    input_path: String,
    output_path: &str,
    size: u32,
) -> Result<String, Error> {
    // // 1. 加载 PNG 图片
    let img = open(&input_path).unwrap(); // 转换为 RGBA 格式

    println!("开始解析 PNG 图片: {}", &size);

    let resized_img = img.resize_exact(size, size, FilterType::Lanczos3);

    let output_path = PathBuf::from(output_path).join(format!("{}.ico", size));

    println!("保存 ico 图片: {:?}", &output_path);
    // let bf = BufWriter::new(output_path);
    // 2. 打开输出文件并创建缓冲写入器
    let output_file = File::create(output_path.clone()).unwrap();
    let writer = BufWriter::new(output_file);
    // 3. 将图片保存为 Ico 格式
    let result = resized_img.write_to(&mut BufWriter::new(writer), ImageFormat::Ico);

    // Ok(&output_path.to_str().unwrap().to_string())

    match result {
        Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
        Err(_) => Err(Error::EncodeFailed),
    }
}
