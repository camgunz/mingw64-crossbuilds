./autogen.sh --build=$BUILD_TRIPLET \
             --host=$HOST_TRIPLET \
             --prefix=$PREFIX \
             --enable-static \
             --enable-shared \
             --without-xft \
             --with-included-modules=yes \
             --with-dynamic-modules=no \
             --disable-gtk-doc \
             || exit 1

make && make install

