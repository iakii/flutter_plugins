use std::fs::File;
pub use std::path::{Path, PathBuf};

use image::{open, GenericImageView};
use imagequant;

use imagequant::Error;

// use super::entity;

pub use imagequant::RGBA;

use super::entity;

pub struct ImagequantImage {
    pub pixels: Vec<RGBA>,
    pub width: usize,
    pub height: usize,
    pub gamma: f64,
}

impl ImagequantImage {
    /// Make an image from RGBA pixels.
    /// Use 0.0 for gamma if the image is sRGB (most images are).
    pub fn new(data: Vec<u8>, width: usize, height: usize, gamma: f64) -> ImagequantImage {
        let pixels: Vec<imagequant::RGBA> = data
            .chunks(4)
            .map(|chunk| imagequant::RGBA {
                r: chunk[0],
                g: chunk[1],
                b: chunk[2],
                a: chunk[3],
            })
            .collect();

        ImagequantImage {
            pixels,
            width,
            height,
            gamma,
        }
    }
}

pub struct Imagequant {
    instance: imagequant::Attributes,
    config: ImagequantImage,
}

impl Imagequant {
    // pub fn new() -> Imagequant {
    //     Imagequant {
    //         instance: imagequant::new(),
    //     }
    // }

    /// Make an image from RGBA pixels.
    /// Use 0.0 for gamma if the image is sRGB (most images are).
    pub fn new(data: Vec<u8>, width: usize, height: usize, gamma: f64) -> Self {
        Self {
            instance: imagequant::new(),
            config: ImagequantImage::new(data, width, height, gamma),
        }
    }

    /// It's better to use `set_quality()`
    pub fn set_max_colors(&mut self, max_colors: u32) -> Result<(), Error> {
        self.instance
            .set_max_colors(max_colors)
            .map_err(Error::from)
    }

    /// Range 0-100, roughly like JPEG.
    ///
    /// If the minimum quality can't be met, the quantization will be aborted with an error.
    ///
    /// Default is min 0, max 100, which means best effort, and never aborts the process.
    ///
    /// If max is less than 100, the library will try to use fewer colors.
    /// Images with fewer colors are not always smaller, due to increased dithering it causes.
    pub fn set_quality(&mut self, minimum: u8, target: u8) -> Result<(), Error> {
        self.instance
            .clone()
            .set_quality(minimum, target)
            .map_err(Error::from)
    }

    /// 1-10.
    ///
    /// Faster speeds generate images of lower quality, but may be useful
    /// for real-time generation of images.
    ///
    /// The default is 4.
    pub fn set_speed(&mut self, value: i32) -> Result<(), Error> {
        self.instance.set_speed(value)
    }

    /// Number of least significant bits to ignore.
    ///
    /// Useful for generating palettes for VGA, 15-bit textures, or other retro platforms.
    pub fn set_min_posterization(&mut self, value: u8) -> Result<(), Error> {
        self.instance
            .set_min_posterization(value)
            .map_err(Error::from)
    }

    /// Create PNG based on specified settings
    pub fn process(self) -> Result<Vec<u8>, Error> {
        let image = self.config;
        let ref mut liq_image = self
            .instance
            .new_image(image.pixels, image.width, image.height, image.gamma)
            .map_err(Error::from)?;

        let mut res = self.instance.quantize(liq_image).map_err(Error::from)?;

        let (palette, pixels) = res.remapped(liq_image).map_err(Error::from)?;

        let mut encoder = lodepng::Encoder::new();

        let _ = encoder.set_palette(palette.as_slice());

        let png_vec: Vec<u8> = encoder
            .encode(pixels.as_slice(), image.width, image.height)
            .unwrap();

        Ok(png_vec)
    }
}

/// 压缩png
pub fn parse_png(path: String, output: String, level: u8) -> Result<String, entity::Error> {
    let filepath = PathBuf::from(path);

    let file = match File::open(&filepath) {
        Ok(file) => file,
        Err(_) => return Err(entity::Error::InputMissing(filepath)),
    };

    let mut decoder = png::Decoder::new(file);

    // 解码头部
    let info = decoder.read_header_info().unwrap();

    let gamma = match info.gama_chunk {
        Some(gamma) => gamma.into_value() as f64,
        None => 1.0,
    };

    let img = open(filepath).unwrap();
    let (w, h) = img.dimensions();

    let mut png = Imagequant::new(img.as_bytes().to_vec(), w as usize, h as usize, gamma);

    png.set_quality(55, level).unwrap();

    let data = png.process().unwrap();
    // 处理data

    let output_path = Path::new(&output).with_extension("png");
    std::fs::write(&output_path, &*data).unwrap();

    Ok(output_path.to_str().unwrap().to_string())
}
