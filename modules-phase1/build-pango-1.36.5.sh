export CFLAGS='-DGLIB_STATIC_COMPILATION=1 -mms-bitfields'

./autogen.sh --build=$BUILD_TRIPLET \
             --host=$HOST_TRIPLET \
             --prefix=$PREFIX \
             --enable-static \
             --enable-shared \
             --without-xft \
             --with-included-modules=yes \
             --with-dynamic-modules=no \
             --disable-gtk-doc \
             --disable-debug \
             || exit 1

make && make install

