cLibFiles = $(wildcard src/*.c)
compilerFlags = -g -fdeclspec -fPIC
libIncludeFlags = -Isrc -I$(VULKAN_SDK)/include
libLinkerFlags = -lvulkan -lxcb -lX11 -lX11-xcb -lxkbcommon -L$(VULKAN_SDK)/lib -L/usr/X11R6/lib

lib:
	rm -rf bin/
	mkdir -p bin/
	clang $(cLibFiles) $(compilerFlags) -shared -o bin/libregnum.so $(libIncludeFlags) $(libLinkerFlags)

buildName = regnum-test
cBuildFiles = $(wildcard test-env/*.c)
buildIncludeFlags = -Itest-env/ -Isrc/
buildLinkerFlags = -Lbin/ -lregnum -Wl,-rpath=bin/

build:
	mkdir -p bin/
	clang $(cBuildFiles) $(compilerFlags) -o bin/$(buildName) $(buildIncludeFlags) $(buildLinkerFlags)
