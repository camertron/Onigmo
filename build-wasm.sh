# Download WASI-SDK from:
# https://github.com/WebAssembly/wasi-sdk/releases

PATH=~/workspace/wabt-1.0.34/bin/:~/workspace/binaryen-version_116/bin:~/workspace/wasi-sdk-20.0/bin:$PATH
STDLIB="wasm/stdlib.c"

clang \
	--target=wasm32 \
	-Oz \
	-flto \
	-nostdlib \
	-c \
	$IPATH -I wasm -I . -I enc/unicode -Wl,-error-limit=0 \
	regparse.c regcomp.c regexec.c regext.c regerror.c \
	regenc.c regtrav.c regversion.c st.c \
	enc/unicode.c enc/ascii.c \
	enc/utf_16be.c enc/utf_16le.c \
	$STDLIB

wasm-ld \
	--no-entry \
	--export-all \
	-o onigmo.wasm \
	*.o

wasm-strip onigmo.wasm
wasm-opt -Oz -o onigmo.wasm onigmo.wasm
