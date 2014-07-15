CFLAGS='-fno-lto -D__USE_MINGW_ANSI_STDIO=1 -Wno-error -include math.h' \
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --enable-xlib=no \
            --enable-xlib-xrender=no \
            --enable-xcb=no \
            --enable-xlib-xcb=no \
            --enable-xcb-shm=no \
            || exit 1

CFLAGS='-fno-lto -D__USE_MINGW_ANSI_STDIO=1 -Wno-error -include math.h' \
make && make install

