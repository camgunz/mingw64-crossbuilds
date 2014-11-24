#!/bin/bash

LA_FILE="$PREFIX/lib/libglib-2.0.la"
GIO_LA_FILE="$PREFIX/lib/libgio-2.0.la"
GMODULE_LA_FILE="$PREFIX/lib/libgmodule-2.0.la"
GOBJECT_LA_FILE="$PREFIX/lib/libgobject-2.0.la"
GTHREAD_LA_FILE="$PREFIX/lib/libgthread-2.0.la"

rm -f win32.cache
echo 'glib_cv_long_long_format=I64' >> win32.cache
echo 'glib_cv_stack_grows=no' >> win32.cache
chmod a-w win32.cache

CPPFLAGS='-DHAVE_IF_NAMETOINDEX=1' ./configure --cache-file=win32.cache \
            --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-shared \
            --disable-static \
            --with-threads=win32 \
            --with-libiconv=gnu \
            --with-pcre=system \
            --enable-debug=no \
            --enable-modular-tests=no \
            --disable-gtk-doc || exit 1

make || exit 1
make install || exit 1

cp $LA_FILE                 $LA_FILE.shared || exit 1
cp $GIO_LA_FILE         $GIO_LA_FILE.shared || exit 1
cp $GMODULE_LA_FILE $GMODULE_LA_FILE.shared || exit 1
cp $GOBJECT_LA_FILE $GOBJECT_LA_FILE.shared || exit 1
cp $GTHREAD_LA_FILE $GTHREAD_LA_FILE.shared || exit 1

CPPFLAGS='-DHAVE_IF_NAMETOINDEX=1' ./configure --cache-file=win32.cache \
            --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --disable-shared \
            --enable-static \
            --with-threads=win32 \
            --with-libiconv=gnu \
            --with-pcre=system \
            --enable-debug=no \
            --enable-modular-tests=no \
            --disable-gtk-doc || exit 1

make || exit 1
make install || exit 1

cp $LA_FILE                 $LA_FILE.static || exit 1
cp $GIO_LA_FILE         $GIO_LA_FILE.static || exit 1
cp $GMODULE_LA_FILE $GMODULE_LA_FILE.static || exit 1
cp $GOBJECT_LA_FILE $GOBJECT_LA_FILE.static || exit 1
cp $GTHREAD_LA_FILE $GTHREAD_LA_FILE.static || exit 1

head -n 11  $LA_FILE.shared >  $LA_FILE || exit 1
tail -n +12 $LA_FILE.static >> $LA_FILE || exit 1

head -n 11  $GIO_LA_FILE.shared >  $GIO_LA_FILE || exit 1
tail -n +12 $GIO_LA_FILE.static >> $GIO_LA_FILE || exit 1

head -n 11  $GMODULE_LA_FILE.shared >  $GMODULE_LA_FILE || exit 1
tail -n +12 $GMODULE_LA_FILE.static >> $GMODULE_LA_FILE || exit 1

head -n 11  $GOBJECT_LA_FILE.shared >  $GOBJECT_LA_FILE || exit 1
tail -n +12 $GOBJECT_LA_FILE.static >> $GOBJECT_LA_FILE || exit 1

head -n 11  $GTHREAD_LA_FILE.shared >  $GTHREAD_LA_FILE || exit 1
tail -n +12 $GTHREAD_LA_FILE.static >> $GTHREAD_LA_FILE || exit 1

