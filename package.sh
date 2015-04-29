#!/bin/bash

. ./config.sh

./check_prereqs.sh

if [ $? -ne 0 ]
then
    exit 1
fi

if [ -f "$PACKAGE_TARNAME" ]
then
    rm -f "$PACKAGE_TARNAME" || exit 1
fi

if [ -f "$PACKAGE_FILENAME" ]
then
    rm -f "$PACKAGE_FILENAME" || exit 1
fi

cp -Ru "$HOST_PREFIX"/* build/ || exit 1

bsdtar -chf "$PACKAGE_TARNAME" build || exit 1

xz -z9 "$PACKAGE_TARNAME" || exit 1

