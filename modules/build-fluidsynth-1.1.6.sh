build_toolchain_file mingw64-toolchain.cmake

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
    || exit 1;

make && make install

