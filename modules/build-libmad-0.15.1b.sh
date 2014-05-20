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
if [ -f "$BUILD_DIR/lib/libmad.la" ]
then
    rm "$BUILD_DIR/lib/libmad.la"
fi
cd "$BUILD_DIR/bin" || exit 1
ln -s $MODULE.dll libmad-0.dll || exit 1
