use super::jpeg::convert_to_jpeg;
pub use super::{entity::Error, png::parse_png, webp::parse_webp};
use flutter_rust_bridge::frb;
use image::imageops::FilterType;
pub use image::ImageFormat;
use image::{open, ImageReader};
use std::path::{Path, PathBuf};
use webp::{Encoder, WebPMemory};

#[frb]
pub struct TinyClient {
    pub path: String,
    pub output: String,
}

impl TinyClient {
    #[flutter_rust_bridge::frb(sync)]
    pub fn from_path(path: String, output: Option<String>) -> Self {
        let output = match output {
            Some(output) => output,
            None => {
                let path = Path::new(&path);
                let filename = path.file_stem().unwrap().to_str().unwrap();
                path.parent()
                    .unwrap()
                    .join(format!("{}", filename))
                    .to_str()
                    .unwrap()
                    .to_string()
            }
        };

        Self { path, output }
    }

    #[flutter_rust_bridge::frb(sync)]
    pub fn file_type(&self) -> Option<ImageFormat> {
        let reader = ImageReader::open(self.path.clone()).unwrap();
        // 获取图片的格式
        reader.format()
    }

    #[flutter_rust_bridge::frb(sync)]
    pub fn is_image_file(&self, path: &str) -> bool {
        let reader = ImageReader::open(path).unwrap();
        // 获取图片的格式
        match reader.format() {
            Some(_) => true,
            None => false,
        }
    }

    pub fn img_convert(
        &self,
        target: ImageFormat,
        quality: Option<u8>,
        size: Option<u32>,
    ) -> Result<String, Error> {
        let q = match quality {
            Some(quality) => quality,
            None => 100,
        };

        match target {
            ImageFormat::Png => {
                return self.jpeg_2_png();
            }
            ImageFormat::Jpeg => {
                return convert_to_jpeg(self.path.clone(), self.output.clone(), q);
            }
            ImageFormat::WebP => {
                return self.img_2_webp(q);
            }
            ImageFormat::Avif => {
                return self.convert_to_avif();
            }
            ImageFormat::Ico => {
                let size = match size {
                    Some(size) => size,
                    None => 256,
                };
                return self.convert_png_to_ico(size);
            }
            _ => {
                return Err(Error::UnsupportedFormat);
            }
        }
    }

    pub fn convert_png_to_ico(&self, size: u32) -> Result<String, Error> {
        // // 1. 加载 PNG 图片
        let img = open(&self.path).unwrap(); // 转换为 RGBA 格式

        let resized_img = img.resize_exact(size, size, FilterType::Lanczos3);

        let output_path = PathBuf::from(&self.output).join(format!("{}.ico", size));

        // 3. 将图片保存为 Ico 格式
        let result = resized_img.save_with_format(&output_path, ImageFormat::Ico);

        match result {
            Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
            Err(_) => Err(Error::EncodeFailed),
        }
    }

    pub fn png_2_jpeg(&self, quality: u8) -> Result<String, Error> {
        let _ = quality;
        let reader = ImageReader::open(&self.path).unwrap();
        // png 2 jpeg
        let img = reader.decode().unwrap().to_rgb8();
        let output_path = Path::new(&self.output).with_extension("jpg");

        let result = img.save_with_format(output_path.clone(), ImageFormat::Jpeg);

        match result {
            Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
            Err(_) => Err(Error::EncodeFailed),
        }
    }

    pub fn jpeg_2_png(&self) -> Result<String, Error> {
        if self.file_type() != Some(ImageFormat::Jpeg) {
            return Err(Error::UnsupportedFormat);
        }
        let reader = ImageReader::open(&self.path).unwrap();
        // jpeg 2 png
        let img = reader.decode().unwrap().to_rgb8();
        let output_path = Path::new(&self.output.clone()).with_extension("png");
        let result = img.save_with_format(output_path.clone(), ImageFormat::Png);
        match result {
            Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
            Err(_) => Err(Error::EncodeFailed),
        }
    }

    pub fn convert_to_avif(&self) -> Result<String, Error> {
        let path = PathBuf::from(&self.path);

        let reader = match ImageReader::open(&path) {
            Ok(reader) => reader,
            Err(_) => return Err(Error::InputMissing(path)),
        };
        let image = reader.decode().unwrap();

        let rgb_image = image.to_rgba8();

        let output_path = Path::new(&self.output).with_extension("avif");

        let result = rgb_image.save_with_format(&output_path, ImageFormat::Avif);
        match result {
            Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
            Err(_) => Err(Error::EncodeFailed),
        }
    }

    pub fn img_2_webp(&self, quality: u8) -> Result<String, Error> {
        parse_webp(self.path.to_string(), self.output.clone(), quality)
    }

    pub fn thumbnail(&self, width: u32, height: u32) -> Result<String, Error> {
        let reader = ImageReader::open(&self.path).unwrap();
        let img = reader.decode().unwrap().thumbnail(width, height);
        // Create the WebP encoder for the above image
        let encoder: Encoder = Encoder::from_image(&img).unwrap();
        // Encode the image at a specified quality 0-100
        let webp: WebPMemory = encoder.encode(75.0);
        // Define and write the WebP-encoded file to a given path
        let output_path = Path::new(&self.output)
            .join(format!("_thumbnail",))
            .with_extension("webp");
        std::fs::write(&output_path, &*webp).unwrap();

        Ok(output_path.to_str().unwrap().to_string())
    }

    fn compress(&self, path: &str, quality: u8) -> Result<String, Error> {
        let filepath = Path::new(&self.path);
        let ext: &str = filepath.extension().unwrap().to_str().unwrap();
        match ext {
            "png" => parse_png(self.path.clone(), self.output.clone(), quality),
            "jpg" => convert_to_jpeg(self.path.clone(), self.output.clone(), quality),
            "jpeg" => convert_to_jpeg(self.path.clone(), self.output.clone(), quality),
            "webp" => parse_webp(path.to_string(), self.output.clone(), quality),
            _ => Err(Error::UnsupportedFormat),
        }
    }

    pub fn parse(self, quality: u8) -> Result<String, Error> {
        self.compress(&self.path.as_str(), quality)
    }
}

#[frb(mirror(ImageFormat))]
pub enum ImageFormatMirror {
    /// An Image in PNG Format
    Png,

    /// An Image in JPEG Format
    Jpeg,

    /// An Image in GIF Format
    Gif,

    /// An Image in WEBP Format
    WebP,

    /// An Image in general PNM Format
    Pnm,

    /// An Image in TIFF Format
    Tiff,

    /// An Image in TGA Format
    Tga,

    /// An Image in DDS Format
    Dds,

    /// An Image in BMP Format
    Bmp,

    /// An Image in ICO Format
    Ico,

    /// An Image in Radiance HDR Format
    Hdr,

    /// An Image in OpenEXR Format
    OpenExr,

    /// An Image in farbfeld Format
    Farbfeld,

    /// An Image in AVIF Format
    Avif,

    /// An Image in QOI Format
    Qoi,

    /// An Image in PCX Format
    Pcx,
}
// ImageFormat
