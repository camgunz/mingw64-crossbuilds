#!/bin/sh

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
