#!/bin/bash

. ./config.sh

./check_prereqs.sh

if [ -f $PACKAGE_TARNAME ]
then
    rm -f $PACKAGE_TARNAME || exit 1
fi

if [ -f $PACKAGE_FILENAME ]
then
    rm -f $PACKAGE_FILENAME || exit 1
fi

bsdtar -chf $PACKAGE_TARNAME build

xz -z9 $PACKAGE_TARNAME

