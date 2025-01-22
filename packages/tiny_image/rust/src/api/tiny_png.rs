pub use super::icon::{config::Config, covert::run_pico};
use super::icons::convert_png_to_ico;
use super::{icon::error::Error, png::parse_png, webp::parse_webp};
use flutter_rust_bridge::frb;
pub use image::ImageFormat;
use image::ImageReader;
use std::path::Path;
use webp::{Encoder, WebPMemory};

#[frb]
pub struct TinyClient {
    pub path: String,
    pub output: String,
}

impl TinyClient {
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

    pub fn file_type(&self) -> Option<ImageFormat> {
        let reader = ImageReader::open(self.path.clone()).unwrap();
        // 获取图片的格式
        reader.format()
    }

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
                return self.jpeg_2_png(Some(q));
            }
            ImageFormat::Jpeg => {
                self.png_2_jpeg(q)
                // return convert_to_jpeg(self.path.clone(), self.output.clone(), q);
            }
            ImageFormat::WebP => {
                return self.img_2_webp(q);
            }
            ImageFormat::Ico => {
                let size = match size {
                    Some(size) => size,
                    None => 256,
                };
                return convert_png_to_ico(self.path.clone(), self.output.clone().as_str(), size);
            }
            _ => {
                return Err(Error::UnsupportedFormat);
            }
        }
    }
    fn png_2_jpeg(&self, quality: u8) -> Result<String, Error> {
        let _ = quality;
        let reader = ImageReader::open(&self.path).unwrap();
        // png 2 jpeg
        let img = reader.decode().unwrap().to_rgb8();
        let output_path = Path::new(&self.output).with_extension("jpg");

        let result = img.save(output_path.clone());

        match result {
            Ok(_) => Ok(output_path.to_str().unwrap().to_string()),
            Err(_) => Err(Error::EncodeFailed),
        }
    }
    pub fn jpeg_2_png(&self, quality: Option<u8>) -> Result<String, Error> {
        let _ = quality;

        if self.file_type() != Some(ImageFormat::Jpeg) {
            return Err(Error::UnsupportedFormat);
        }

        let reader = ImageReader::open(&self.path).unwrap();
        // jpeg 2 png
        let img = reader.decode().unwrap().to_rgb8();
        let output_path = Path::new(&self.output.clone()).with_extension("png");
        let result = img.save(output_path.clone());
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
            "png" => {
                if self.file_type() == Some(ImageFormat::Png) {
                    return parse_png(self.path.clone(), self.output.clone(), quality);
                }
                return Err(Error::UnsupportedFormat);
            }
            "jpg" => self.png_2_jpeg(quality),
            // "jpg" => convert_to_jpeg(self.path.clone(), self.output.clone(), quality),
            "jpeg" => self.png_2_jpeg(quality),
            "webp" => parse_webp(path.to_string(), self.output.clone(), quality),
            _ => {
                return Err(Error::UnsupportedFormat);
            }
        }
    }

    // fn image_2_ico(&self, config: Config) -> Result<String, Error> {
    //     if self.file_type() == Some(ImageFormat::Png) || self.file_type() == Some(ImageFormat::Jpeg)
    //     {
    //         return run_pico(&config);
    //     }
    //     return Err(Error::UnsupportedFormat);
    // }

    pub fn parse(self, quality: u8) -> Result<String, Error> {
        // // 判断 path是文件还是文件夹
        // let path = Path::new(&self.path);
        // if path.is_dir() {
        //     let dir = std::fs::read_dir(path).unwrap();
        //     for entry in dir {
        //         let entry = entry.unwrap();
        //         let path = entry.path();
        //         if path.is_file() {
        //             let path = path.to_str().unwrap();
        //             let _ = self.compress(path, quality);
        //         }
        //     }
        // } else {
        //  self.compress(&self.path.as_str(), quality)
        // }

        // Ok(())

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
