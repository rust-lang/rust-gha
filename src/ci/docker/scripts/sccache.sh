set -ex

if [ "$(dpkg --print-architecture)" = "arm64" ]; then
  curl -fo /usr/local/bin/sccache \
    https://ci-mirrors.rust-lang.org/rustc/2019-12-17-sccache-aarch64-unknown-linux-gnu
else
  curl -fo /usr/local/bin/sccache \
    https://ci-mirrors.rust-lang.org/rustc/2018-04-02-sccache-x86_64-unknown-linux-musl
fi

chmod +x /usr/local/bin/sccache
