./autogen.sh --build=$BUILD_TRIPLET \
             --host=$HOST_TRIPLET \
             --prefix=$PREFIX \
             --enable-static \
             --enable-shared \
             --with-glib=yes \
             --with-gobject=no \
             --with-cairo=yes \
             --with-icu=no \
             --with-graphite2=no \
             --with-freetype=yes \
             --with-uniscribe=no \
             --with-coretext=no \
             || exit 1

V=1 make && make install

