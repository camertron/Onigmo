clang \
	--target=wasm32-wasi \
	--sysroot=/wasi-sdk-21.0/share/wasi-sysroot \
	-Oz \
	-flto \
	-c \
	-I wasm -I . -I enc/unicode -I /wasi-sdk-21.0/share/wasi-sysroot/include/ \
	regparse.c regcomp.c regexec.c regext.c regerror.c \
	regenc.c regtrav.c regversion.c st.c \
	enc/unicode.c enc/ascii.c enc/utf_16le.c

wasm-ld \
	--no-entry \
	--export-all \
	--allow-undefined \
	--error-limit=0 \
	-o onigmo.wasm \
	-L /wasi-sdk-21.0/share/wasi-sysroot/lib/wasm32-wasi/ \
	-l c \
	*.o

wasm-opt -Oz -o onigmo.wasm onigmo.wasm
wasm-strip onigmo.wasm
