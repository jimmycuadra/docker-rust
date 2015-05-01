FROM debian:wheezy
MAINTAINER Jimmy Cuadra <jimmy@jimmycuadra.com>

ENV RUST_VERSION=1.0.0-beta.3

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev && \
  curl -sO https://static.rust-lang.org/dist/rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz && \
  tar -xvzf rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz && \
  ./rust-$RUST_VERSION-x86_64-unknown-linux-gnu/install.sh && \
  apt-get remove --purge -y curl && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf rust-$RUST_VERSION-x86_64-unknown-linux-gnu{,.tar.gz} \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]
