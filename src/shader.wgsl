fn rand(uv: vec2<f32>) -> f32 {
    return (fract(sin(dot(uv.xy, vec2(23.53, 44.0))) * 42350.45));
}

fn noise(uv: vec2<f32>) -> f32 {
    let i: vec2<f32> = floor(uv);
    let j: vec2<f32> = fract(uv);
    let blur: vec2<f32> = smoothstep(vec2<f32>(0.0, 0.0), vec2<f32>(1.0, 1.0), j);

    let a: f32 = rand(i);
    let b: f32 = rand(i + vec2<f32>(1.0, 0.0));

    return mix(a, b, blur.x);
}


struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
};

@vertex
fn vs_main(in: VertexInput) -> @builtin(position) vec4<f32> {
    // Generate a triangle to fill the screen.
    // The approach is based on: https://stackoverflow.com/a/59739538/4593433.
    if(in.vertex_index == 0u) {
        return vec4<f32>(-1.0, -1.0, 0.0, 1.0);
    }

    if(in.vertex_index == 1u) {
        return vec4<f32>(3.0, -1.0, 0.0, 1.0);
    }

    return vec4<f32>(-1.0, 3.0, 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) pos: vec4<f32>) -> @location(0) vec4<f32> {
    let uv = pos.yx * 10.0 / 512.0;
    return vec4<f32>(vec3<f32>(1.0) * noise(uv), 1.0);
    //return vec4<f32>(0.0, uv.x, uv.y, 1.0);
}