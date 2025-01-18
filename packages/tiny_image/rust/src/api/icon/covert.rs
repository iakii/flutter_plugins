use std::{fs, path::PathBuf};

use super::{config::Config, error::Error, icon::Icon, image::Image};

/// Run Pico using command line arguments and exit on error.

/// Run Pico using configuration data.
pub fn run_pico(config: &Config) -> Result<String, Error> {
    let output_path = PathBuf::from(config.output_path.clone());

    if output_path.is_file() && !config.force {
        return Err(Error::OutputExists(output_path.clone()));
    }

    let paths = expand_paths(&config.input_paths)?;
    let images = read_images(paths)?;
    let data: Vec<u8> = Icon::from_images(images, config.sort).encode()?;
    fs::write(&config.output_path, data.as_slice())?;
    Ok(config.output_path.clone())
}

/// Expand a vector of paths to PNG files and directories to a vector of paths
/// to PNG files.
fn expand_paths(paths: &Vec<String>) -> Result<Vec<PathBuf>, Error> {
    let mut expanded = Vec::new();

    for path in paths {
        let file_path = PathBuf::from(path);

        if file_path.is_dir() {
            expanded.append(&mut expand_dir(&file_path)?);
        } else {
            expanded.push(file_path.clone());
        }
    }

    if expanded.is_empty() {
        Err(Error::NoInputs)
    } else {
        Ok(expanded)
    }
}

/// Expand a directory path to a vector of paths to PNG files.
fn expand_dir(dir: &PathBuf) -> Result<Vec<PathBuf>, Error> {
    let mut paths = Vec::new();

    for entry in fs::read_dir(dir)? {
        let path = entry?.path();

        if path.is_file() && path.extension().unwrap_or_default().to_ascii_lowercase() == "png" {
            paths.push(path);
        }
    }

    Ok(paths)
}

/// Read a vector of images using a vector of paths to PNG input files.
fn read_images(paths: Vec<PathBuf>) -> Result<Vec<Image>, Error> {
    let mut images = Vec::with_capacity(paths.len());

    for path in paths {
        images.push(Image::from_path(path)?);
    }

    Ok(images)
}
