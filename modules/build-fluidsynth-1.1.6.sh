build_toolchain_file mingw64-toolchain.cmake

CFLAGS="$CFLAGS -DFLUIDSYNTH_NOT_A_DLL" \
cmake . \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_TOOLCHAIN_FILE=mingw64-toolchain.cmake \
    -DCMAKE_CACHEFILE_DIR=$BASE_DIR/$MODULE/fbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=FALSE \
    -DOSS_SUPPORT=FALSE \
    -Denable-ladspa=no \
    -Denable-portaudio=no \
    -Denable-debug=no \
    -Denable-libsndfile=no \
    -Denable-aufile=no \
    -Denable-pulseaudio=no \
    -Denable-jack=no \
    -Denable-midishare=no \
    -Denable-readline=no \
    -Denable-dbus=no \
    -Denable-ladcca=no \
    -Denable-lash=no \
    -Denable-alsa=no \
    -Denable-coreaudio=no \
    -Denable-coremidi=no \
    -Denable-framework=no \
    -Denable-dart=no \
    || exit 1

make || exit 1
make install || exit 1
make clean || exit 1

rm -rf config.h \
       fluidsynth.pc \
       CPackConfig.cmake \
       CPackSourceConfig.cmake \
       CMakeCache.txt \
       cmake_install.cmake \
       Makefile \
       CMakeFiles \
       install_manifest.txt \
       || exit 1

cmake . \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_TOOLCHAIN_FILE=mingw64-toolchain.cmake \
    -DCMAKE_CACHEFILE_DIR=$BASE_DIR/$MODULE/fbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DOSS_SUPPORT=FALSE \
    -Denable-ladspa=no \
    -Denable-portaudio=no \
    -Denable-debug=no \
    -Denable-libsndfile=no \
    -Denable-aufile=no \
    -Denable-pulseaudio=no \
    -Denable-jack=no \
    -Denable-midishare=no \
    -Denable-readline=no \
    -Denable-dbus=no \
    -Denable-ladcca=no \
    -Denable-lash=no \
    -Denable-alsa=no \
    -Denable-coreaudio=no \
    -Denable-coremidi=no \
    -Denable-framework=no \
    -Denable-dart=no \
    || exit 1

make && make install

