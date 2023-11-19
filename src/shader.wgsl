fn rand(uv: vec2<f32>) -> f32 {
    return fract(dot(uv.xy, vec2(23.53, 44.0)) * 40000.0);
}

struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
};

@vertex
fn vs_main(in: VertexInput) -> @builtin(position) vec4<f32> {
    // Generate a triangle to fill the screen.
    // The approach is based on: https://stackoverflow.com/a/59739538/4593433.
    var fullscreen_vertecies: array<vec4<f32>, 3> = array<vec4<f32>, 3>(
        vec4<f32>(-1.0, -1.0, 0.0, 1.0),
        vec4<f32>(3.0, -1.0, 0.0, 1.0),
        vec4<f32>(-1.0, 3.0, 0.0, 1.0)
    );

    return fullscreen_vertecies[in.vertex_index];
}

@fragment
fn fs_main(@builtin(position) pos: vec4<f32>) -> @location(0) vec4<f32> {
    let sections = 10.0;
    let uv = pos.xy / 512.0;
    let sectioned_uv = uv * sections;
    return vec4<f32>(vec3<f32>(rand(floor(sectioned_uv))), 1.0);
}