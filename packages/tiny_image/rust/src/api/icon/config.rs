/// Configuration data for Pico.
pub struct Config {
    /// The paths to the PNG input files and directories.
    pub input_paths: Vec<String>,

    /// The path to the ICO output file.
    pub output_path: String,

    /// Whether to sort ICO entries by descending resolution.
    pub sort: bool,

    /// Whether to overwrite an existing ICO output file.
    pub force: bool,
}
