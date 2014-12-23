#!/bin/bash

. ./config.sh

./check_prereqs.sh

function build_toolchain_file () {
    if [ ! $1 ]
    then
        echo 'No tool chain file passed to "build_toolchain_file"'
        exit 1
    fi

    echo "SET(CMAKE_SYSTEM_NAME Windows)" > $1
    echo "SET(CMAKE_C_COMPILER $CC)" >> $1
    echo "SET(CMAKE_C_COMPILER_ENV_VAR $CC)" >> $1
    echo "SET(CMAKE_CXX_COMPILER $CXX)" >> $1
    echo "SET(CMAKE_RC_COMPILER $WINDRES)" >> $1
    echo "SET(CMAKE_FIND_ROOT_PATH $HOST_PREFIX)" >> $1

    echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> $1
    echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> $1
    echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> $1
}

export -f build_toolchain_file

rm -rf $BUILD_DIR || exit 1
mkdir $BUILD_DIR || exit 1

for module in `cat modules.list`
do
    export MODULE=$module
    cd $BASE_DIR/source/$MODULE

    if [ -f $PATCH_DIR/$MODULE.patch ]
    then
        echo "Patching $MODULE"
        patch -p0 < $PATCH_DIR/$MODULE.patch
    else
        echo "No patch found"
    fi

    $MODULES_DIR/build-$MODULE.sh || exit 1
done

