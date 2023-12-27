all: bin lib build

bin:
	rm -rf bin/
	mkdir -p bin/

cLibFiles = $(wildcard src/*.c)
compilerFlags = -g -fdeclspec -fPIC
libIncludeFlags = -Isrc -Iinclude #-I$(VULKAN_SDK)/include
libLinkerFlags = #-lvulkan -L$(VULKAN_SDK)/lib

lib:
	clang $(cLibFiles) $(compilerFlags) -shared -o bin/libregnum.so $(libIncludeFlags) $(libLinkerFlags)

buildName = regnum-test
cBuildFiles = $(wildcard test-env/*.c) src/glad.c
buildIncludeFlags = -Itest-env/ -Isrc/ -Iinclude
buildLinkerFlags = -lglfw -lGL -Lbin/ -lm -lregnum -Wl,-rpath=bin/

build:
	clang $(cBuildFiles) $(compilerFlags) -o bin/$(buildName) $(buildIncludeFlags) $(buildLinkerFlags)

all: build lib
