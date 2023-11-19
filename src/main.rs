use shader_playground_lib::VIEWPORT_SIZE;
use winit::{dpi::LogicalSize, event_loop::EventLoop, window::WindowBuilder};

/// The main program entry point on desktop operating
/// systems.
fn main() {
    let event_loop = EventLoop::new().expect("Failed to spawn winit event loop.");
    let window = WindowBuilder::new()
        .with_inner_size(LogicalSize::new(VIEWPORT_SIZE, VIEWPORT_SIZE))
        .build(&event_loop)
        .expect("Failed to generate winit window.");
    pollster::block_on(shader_playground_lib::run(event_loop, window));
}
