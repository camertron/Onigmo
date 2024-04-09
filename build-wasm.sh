clang \
	--target=wasm32 \
	-Oz \
	-flto \
	-nostdlib \
	-c \
	-I wasm -I . -I enc/unicode \
	regparse.c regcomp.c regexec.c regext.c regerror.c \
	regenc.c regtrav.c regversion.c st.c \
	enc/unicode.c enc/ascii.c \
	enc/utf_16be.c enc/utf_16le.c \
	wasm/stdlib.c

wasm-ld \
	--no-entry \
	--export-all \
	--unresolved-symbols=ignore-all \
	--error-limit=0 \
	-o onigmo.wasm \
	*.o

wasm-opt -Oz -o onigmo.wasm onigmo.wasm
wasm-strip onigmo.wasm
