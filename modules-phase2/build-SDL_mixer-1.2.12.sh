./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --disable-static \
            --enable-shared \
            --with-sdl-prefix=$PREFIX \
            --disable-sdltest \
            --disable-smpegtest \
            --disable-music-mp3 \
            --disable-music-mod-modplug \
            --enable-music-mp3-mad-gpl \
            --enable-music-mod \
            --enable-music-mod-shared \
            --enable-music-fluidsynth-shared \
            --enable-music-ogg-shared \
            --enable-music-flac-shared \
            --enable-music-mp3-shared \
            || exit 1

make || exit 1
make install || exit 1
make clean || exit 1

CFLAGS="$CFLAGS -DMODPLUG_STATIC -DFLUIDSYNTH_NOT_A_DLL -DMIKMOD_STATIC" \
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --disable-shared \
            --with-sdl-prefix=$PREFIX \
            --disable-sdltest \
            --disable-smpegtest \
            --disable-music-mp3 \
            --disable-music-mod-modplug \
            --enable-music-mp3-mad-gpl \
            --enable-music-mod \
            --disable-music-mod-shared \
            --disable-music-fluidsynth-shared \
            --disable-music-ogg-shared \
            --disable-music-flac-shared \
            --disable-music-mp3-shared \
            || exit 1

make && make install
