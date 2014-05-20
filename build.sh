#!/bin/bash

. ./config.sh

if [ ! `which msgfmt` ]
then
    echo "Couldn't find msgfmt program, install gettext"
    exit 1
fi

if [ ! `which libtool` ]
then
    echo "Couldn't find libtool program, install libtool"
    exit 1
fi

if [ ! `which pkg-config` ]
then
    echo "Couldn't find pkg-config program, install pkg-config"
    exit 1
fi

if [ ! `which patch` ]
then
    echo "Couldn't find patch program, install patch"
    exit 1
fi

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

# rm -rf $BUILD_DIR || exit 1
# mkdir $BUILD_DIR || exit 1

for module in `cat modules_list`
do
    export MODULE=$module
    cd $BASE_DIR/source/$MODULE

    if [ -f ../../patches/$MODULE.patch ]
    then
        echo "Patching $MODULE"
        patch -p0 < ../../patches/$MODULE.patch
    else
        echo "No patch found"
    fi

    ../../modules/build-$MODULE.sh || exit 1
done

