LA_FILE="$BUILD_DIR/lib/libmad.la"

./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --disable-debugging \
            || exit 1

make || exit 1

$CC $CFLAGS -shared .libs/*.o -o .libs/$MODULE.dll \
    -Xlinker --out-implib \
    -Xlinker .libs/libmad.dll.a \
    || exit 1

make install || exit 1
cp -v .libs/$MODULE.dll $BUILD_DIR/bin || exit 1

echo "dlname='../bin/$MODULE.dll'" > $LA_FILE
echo "library_names='libmad.dll.a'" >> $LA_FILE
echo "old_library='libmad.a'" >> $LA_FILE
echo "dependency_libs=' -L$BUILD_DIR/lib'" >> $LA_FILE
echo "current=2" >> $LA_FILE
echo "age=2" >> $LA_FILE
echo "revision=1" >> $LA_FILE
echo "installed=yes" >> $LA_FILE
echo "shouldnotlink=no" >> $LA_FILE
echo "dlopen=''" >> $LA_FILE
echo "dlpreopen=''" >> $LA_FILE
echo "libdir='$BUILD_DIR/lib'" >> $LA_FILE

