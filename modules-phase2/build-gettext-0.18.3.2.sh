CFLAGS="$CFLAGS -O2" \
CXXFLAGS="$CXXFLAGS -O2" \
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --with-libiconv-prefix=$BUILD_DIR \
            --with-gettext-prefix=$BUILD_DIR \
            --with-libglib-2.0-prefix=$BUILD_DIR \
            || exit 1

make && make install

