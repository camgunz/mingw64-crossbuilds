CFLAGS="$CFLAGS -O2" \
CXXFLAGS="$CXXFLAGS -O2" \
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            || exit 1

make && make install

