# docker-rust

Fork from [Docker Hub](https://hub.docker.com/r/jimmycuadra/rust/).

This repository is used to build a Docker image for the Rust programming
language and a few supporting tools. The image includes the following tools :
* `rustc`,
* `rustdoc`,
* `cargo`,
* `cargo-check,
* `git`,
* SSL certificates,
* build essentials,

So it should be able to run `cargo build` on most projects out of the box.
The path `/source` is a volume where you can mount a Cargo project from the
host machine.

## Usage

### work inside the docker
The following command will drop you into a Bash shell with the current
directory on the host shared. From there you can run `rustc`, `rustdoc`,
and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source grummfy/rust
```

### work 

## License

[MIT](http://opensource.org/licenses/MIT)
