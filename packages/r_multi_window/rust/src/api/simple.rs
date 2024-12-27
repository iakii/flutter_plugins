use flutter_rust_bridge::frb;
use glutin::{
    config::ConfigTemplateBuilder,
    context::{ContextApi, ContextAttributesBuilder, NotCurrentGlContext},
    display::Display,
    prelude::*,
    surface::{GlSurface, SurfaceAttributesBuilder, WindowSurface},
};
use winit::{
    dpi::LogicalSize,
    event_loop::EventLoop,
};

pub struct WindowContext {
    pub surface: GlSurface<WindowSurface>,
    pub gl_context: NotCurrentGlContext,
}

/// 创建 OpenGL 渲染窗口
pub fn create_window(title: &str, width: u32, height: u32) -> Result<WindowContext, String> {
    let event_loop = EventLoop::new();
    let window = WindowBuilder::new()
        .with_title(title)
        .with_inner_size(LogicalSize::new(width, height))
        .build(&event_loop)
        .map_err(|e| format!("Failed to create window: {:?}", e))?;

    let display = Display::new(None).map_err(|e| format!("Failed to create display: {:?}", e))?;
    let config = display
        .find_config(&ConfigTemplateBuilder::new())
        .map_err(|e| format!("Failed to find config: {:?}", e))?;

    let context_attributes = ContextAttributesBuilder::new()
        .with_context_api(ContextApi::OpenGl(Some((3, 3)))); // 使用 OpenGL 3.3
    let not_current_context = display
        .create_context(&config, &context_attributes)
        .map_err(|e| format!("Failed to create OpenGL context: {:?}", e))?;

    let surface_attributes =
        SurfaceAttributesBuilder::<WindowSurface>::new().build(window.raw_window_handle());
    let surface = display
        .create_window_surface(&config, &surface_attributes)
        .map_err(|e| format!("Failed to create surface: {:?}", e))?;

    Ok(WindowContext {
        surface,
        gl_context: not_current_context,
    })
}

/// 渲染数据
pub fn render(window_context: &mut WindowContext, data: &[u8], width: u32, height: u32) {
    // 激活 OpenGL 上下文
    let gl_context = window_context
        .gl_context
        .make_current(&window_context.surface)
        .expect("Failed to make context current");

    // 使用 OpenGL 渲染数据
    unsafe {
        gl::Viewport(0, 0, width as i32, height as i32);
        gl::ClearColor(0.1, 0.2, 0.3, 1.0);
        gl::Clear(gl::COLOR_BUFFER_BIT);
        // 添加纹理绘制等操作
    }

    // 交换缓冲区
    window_context
        .surface
        .swap_buffers(&gl_context)
        .expect("Failed to swap buffers");
}

/// 创建一个新窗口
#[frb]
pub fn create_new_window(title: String, width: u32, height: u32) -> Result<String, String> {
    let mut manager = WINDOW_MANAGER.lock().unwrap();
    manager.create_window(title, width, height)
}

/// 渲染数据到指定窗口
#[frb]
pub fn render_window(window_id: String, data: Vec<u8>, width: u32, height: u32) -> Result<(), String> {
    let mut manager = WINDOW_MANAGER.lock().unwrap();
    manager.render_to_window(window_id, data, width, height)
}

/// 关闭窗口
#[frb]
pub fn close_window(window_id: String) -> Result<(), String> {
    let mut manager = WINDOW_MANAGER.lock().unwrap();
    manager.close_window(window_id)
}



#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
