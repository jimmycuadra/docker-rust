# docker-rust

Public trusted images available on:

* [Docker Hub](https://hub.docker.com/r/jimmycuadra/rust/)
* [Quay.io](https://quay.io/repository/jimmycuadra/rust)

This repository is used to build a Docker image for the Rust programming language and a few supporting tools.
The image includes `rustc`, `rustdoc`, `cargo`, `git`, SSL certificates, and build essentials, so it should be able to run `cargo build` on most projects out of the box.
The working directory inside the container is `/source`.
You can use this path to mount a Cargo project from the host machine.

## Usage

The following command will drop you into a Bash shell with the current directory on the host shared. From there you can run `rustc`, `rustdoc`, and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source jimmycuadra/rust
```

Build a release without an interactive shell:

``` bash
docker run --rm -v $(pwd):/source jimmycuadra/rust cargo build --release
```

## License

[MIT](http://opensource.org/licenses/MIT)
