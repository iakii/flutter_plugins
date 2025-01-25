pub struct IconsClient {
    pub data: Vec<u8>,
    pub config: IconsConfig,
}

impl IconsClient {
    pub fn new(data: Vec<u8>, config: IconsConfig) -> Self {
        IconsClient { data, config }
    }

    pub fn to_android(&self) {
        // 生成android 资源icon文件
        // 1. 创建res目录
        // 2. 创建mipmap-xxx目录
        // 3. 创建ic_launcher.png文件
        // 4. 将data写入ic_launcher.png文件
    }

    pub fn to_ios(&self) {}

    pub fn to_ohos(&self) {}

    pub fn to_macos(&self) {}

    pub fn to_windows(&self) {}

    pub fn to_web(&self) {}

    pub fn to_custom(&self) {}
}
//

pub struct IconsConfig {
    pub android: bool,
    pub ios: bool,
    pub ohos: bool,
    pub macos: bool,
    pub windows: bool,
    pub web: bool,
    pub custom: Vec<u32>,
}
