use winit::event_loop::EventLoop;

/// The main program entry point on desktop operating
/// systems.
fn main() {
    let event_loop = EventLoop::new().unwrap();
    let window = winit::window::Window::new(&event_loop).unwrap();
    pollster::block_on(shader_playground_lib::run(event_loop, window));
}
