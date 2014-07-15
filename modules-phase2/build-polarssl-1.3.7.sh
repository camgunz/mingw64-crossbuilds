build_toolchain_file mingw64-toolchain.cmake

cmake . -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$PREFIX \
                           -DCMAKE_TOOLCHAIN_FILE=mingw64-toolchain.cmake \
                           || exit 1

make || exit 1
make install

