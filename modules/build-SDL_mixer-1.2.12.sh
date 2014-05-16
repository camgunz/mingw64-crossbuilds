./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --with-sdl-prefix=$PREFIX \
            --disable-sdltest \
            --disable-music-mod-shared \
            --enable-music-mp3-mad-gpl \
            || exit 1

make && make install

