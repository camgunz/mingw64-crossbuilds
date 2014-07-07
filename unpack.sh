#!/bin/bash

if [ ! `which unzip` ]
then
    echo "Couldn't find unzip program, install unzip"
    exit 1
fi

if [ ! `which hg` ]
then
    echo "Couldn't find hg program, install Mercurial"
    exit 1
fi

if [ ! `which git` ]
then
    echo "Couldn't find git program, install Git"
    exit 1
fi

if [ ! `which svn` ]
then
    echo "Couldn't find svn program, install Subversion"
    exit 1
fi

rm -rf source || exit 1
mkdir source || exit 1
cd source

for archive in `cat ../archives.list`
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

for hg_repo in `cat ../hg_repos.list`
do
    repo_name=`basename $hg_repo`
    echo "Unpacking $repo_name (cloning from Mercurial repository)"
    hg clone $hg_repo $repo_name
done

for git_repo in `cat ../git_repos.list`
do
    repo_name=`basename $git_repo`
    echo "Unpacking $repo_name (cloning from Git repository)"
    git clone $git_repo $repo_name
done

