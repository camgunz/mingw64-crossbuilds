make AR="$BIN_DIR/$HOST_TRIPLET-ar rcu" \
     RANLIB="$BIN_DIR/$HOST_TRIPLET-ranlib" \
     STRIP="$BIN_DIR/$HOST_TRIPLET-strip" \
     CC="$BIN_DIR/$HOST_TRIPLET-gcc" \
     INSTALL_TOP="$BUILD_DIR" \
     TO_BIN="lua.exe luac.exe lua52.dll" \
     mingw install

