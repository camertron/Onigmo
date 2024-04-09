FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y wabt binaryen wget
RUN wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-21/wasi-sdk-21.0-linux.tar.gz -O wasi-sdk.tar.gz && \
    tar -zxvf wasi-sdk.tar.gz && \
    rm wasi-sdk.tar.gz
WORKDIR /usr/src/onigmo
CMD PATH=$PATH:/wasi-sdk-21.0/bin ./build-wasm.sh
