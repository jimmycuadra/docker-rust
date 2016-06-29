FROM debian:jessie
MAINTAINER Grummfy <me@grummfy.be>
# forked from https://github.com/jimmycuadra/docker-rust

ENV USER root
ARG RUST_VERSION=stable
ENV RUST_VERSION ${RUST_VERSION}

# uppdate the system and get curl, build-essential, git, etc
RUN apt-get update && \
	apt-get upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		curl \
		git \
		libssl-dev \
		sudo \
		file

COPY install_rust.sh /root/install_rust.sh

RUN sh /root/install_rust.sh $RUST_VERSION

# cleanup
RUN	DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
	DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
	rm -rf \
		/var/lib/apt/lists/* \
		/tmp/* \
		/var/tmp/* && \
	mkdir /source

VOLUME ["/source"]

WORKDIR /source

CMD ["/bin/bash"]
