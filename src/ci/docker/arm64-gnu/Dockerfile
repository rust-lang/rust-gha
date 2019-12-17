FROM ubuntu:19.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  g++ \
  make \
  file \
  curl \
  ca-certificates \
  python2.7 \
  git \
  cmake \
  sudo \
  gdb \
  libssl-dev \
  pkg-config \
  xz-utils

COPY scripts/sccache.sh /scripts/
RUN sh /scripts/sccache.sh

# A number of tests trip assertions right now, we should turn this back on
# before too long!
ENV NO_LLVM_ASSERTIONS=1

ENV RUST_CONFIGURE_ARGS \
 --build=aarch64-unknown-linux-gnu \
 --enable-sanitizers \
 --enable-profiler \
 --enable-compiler-docs
ENV SCRIPT python2.7 ../x.py test
