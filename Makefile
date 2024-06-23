all: clean build-image compile

clean:
	rm -f *.o onigmo.wasm

build-image:
	script/build-image.sh

compile:
	script/compile.sh
