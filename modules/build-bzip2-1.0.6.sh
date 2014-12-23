CFLAGS="$CFLAGS -I`pwd`"
STATICFLAGS="-D_FILE_OFFSET_BITS=64 -Wall -Winline -O2"
SHAREDFLAGS="$STATICFLAGS -fpic -fPIC"

echo $CFLAGS

$CC $CFLAGS $LDFLAGS $STATICFLAGS -c blocksort.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c huffman.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c crctable.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c randtable.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c compress.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c decompress.c || exit 1
$CC $CFLAGS $LDFLAGS $STATICFLAGS -c bzlib.c || exit 1
$AR cq libbz2.a blocksort.o huffman.o crctable.o randtable.o compress.o \
                decompress.o bzlib.o || exit 1
$RANLIB libbz2.a || exit 1

rm -f *.o

$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c blocksort.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c huffman.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c crctable.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c randtable.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c compress.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c decompress.c || exit 1
$CC $CFLAGS $LDFLAGS $SHAREDFLAGS -c bzlib.c || exit 1

$CC -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 \
    blocksort.o huffman.o crctable.o randtable.o compress.o decompress.o \
    bzlib.o || exit 1
ln -s libbz2.so.1.0.6 libbz2.so.1.0
ln -s libbz2.so.1.0 libbz2.so.1

cp libbz2.a libbz2.so.1.0.6 libbz2.so.1.0 libbz2.so.1 $PREFIX/lib
cp bzlib.h $PREFIX/include

