// use ico::{IconDir, IconDirEntry, IconImage};
use image::{imageops::FilterType, open, ImageFormat};
use std::{fs::File, io::BufWriter, path::PathBuf};

use super::icon::error::Error;

pub fn convert_png_to_ico(input_path: String, output_path: &str) -> Result<String, Error> {
    // // 1. 加载 PNG 图片
    let img = open(&input_path).unwrap(); // 转换为 RGBA 格式

    // // 2. 定义图标尺寸
    let sizes = vec![16, 32, 48, 64, 128, 256];

    // 3. 创建 ICO 文件目录
    // let mut icon_dir = IconDir::new(ico::ResourceType::Icon);

    for &size in &sizes {
        println!("开始解析 PNG 图片: {}", &size);
        let resized_img = img.resize_exact(size, size, FilterType::Lanczos3);
        // println!("开始创建 ICO 图片: {}", &size);
        // // 4. 创建 ICO 图标条目
        // let image = IconImage::from_rgba_data(size, size, resized_img.to_rgb8().into_raw());

        // icon_dir.add_entry(IconDirEntry::encode(&image).unwrap());

        let output_path = PathBuf::from(output_path).join(format!("{}.ico", size));

        println!("保存 ico 图片: {:?}", &output_path);
        // let bf = BufWriter::new(output_path);
        // 2. 打开输出文件并创建缓冲写入器
        let output_file = File::create(output_path)?;
        let writer = BufWriter::new(output_file);
        // 3. 将图片保存为 JPEG 格式
        let _ = resized_img.write_to(&mut BufWriter::new(writer), ImageFormat::Ico);
    }

    Ok("ok".to_string())
}
