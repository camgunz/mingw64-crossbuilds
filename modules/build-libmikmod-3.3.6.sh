./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-shared \
            --enable-static \
            --disable-af \
            --disable-alsa \
            --disable-pulseaudio \
            --disable-esd \
            --disable-nas \
            --enable-aiff \
            --enable-wav \
            --enable-raw \
            --enable-stdout \
            --enable-pipe \
            --disable-sdl \
            --disable-sdl2 \
            --enable-openal \
            --disable-oss \
            --disable-osx \
            --disable-mac \
            --enable-win \
            --enable-ds \
            --enable-xaudio2 \
            --disable-xaudio28 \
            --disable-os2 \
            --disable-dart \
            --disable-sam9407 \
            --disable-ultra \
            --disable-dl \
            --disable-esdtest \
            --disable-sdltest \
            --with-sdl-prefix=$PREFIX \
            || exit 1

make && make install

