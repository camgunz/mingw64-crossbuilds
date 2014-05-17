#!/bin/bash

if [ ! `which unzip` ]
then
    echo "Couldn't find unzip program, install unzip"
    exit 1
fi

if [ ! `which hg` ]
then
    echo "Couldn't find hg program, install mercurial"
    exit 1
fi

rm -rf source || exit 1
mkdir source || exit 1
cd source

for archive in `cat ../archive_list`
do
    extension=`echo "$archive" | awk -F . '{print $NF}'`
    echo "Unpacking $archive"
    if [ "$extension" = 'zip' ]
    then
        unzip -q ../archives/$archive || exit 1
    else
        tar xf ../archives/$archive || exit 1
    fi
done

hg clone https://bitbucket.org/zserge/jsmn jsmn

