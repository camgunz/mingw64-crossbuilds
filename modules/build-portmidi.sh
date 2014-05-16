build_toolchain_file mingw64-toolchain.cmake

rm -rf pbuild || exit 1
mkdir pbuild || exit 1
cd pbuild

cmake .. -G"Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_TOOLCHAIN_FILE=mingw64-toolchain.cmake \
    -DCMAKE_CACHEFILE_DIR=$BASE_DIR/$MODULE/pbuild \
    || exit 1;
  make && \
  cp libportmidi.dll libportmidi.dll.a libportmidi_s.a $PREFIX/lib &&
  cp ../pm_common/portmidi.h $PREFIX/include
