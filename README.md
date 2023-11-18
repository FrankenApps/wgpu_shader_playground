# WGPU Shader Playground
Used to explore different shaders using [WGSL](https://www.w3.org/TR/WGSL/) and [`wgpu`](https://wgpu.rs/).

## How to run
### Desktop
The project can be run using [`cargo`](https://github.com/rust-lang/cargo):
```
cargo run --release
```

### WASM
The project can run on the web with [WebGL2](https://registry.khronos.org/webgl/specs/latest/2.0/). To compile the project to webassembly, [`wasm-pack`](https://rustwasm.github.io/) is used:
```
wasm-pack build --out-dir docs --target web
```

The website can then for example be opened with [live-server](https://www.npmjs.com/package/live-server).