#!/bin/sh

# sudo apt-get install mercurial

#VERSION=4.3.0.20110221
VERSION=`dpkg-parsechangelog | grep '^Version' | cut -d' ' -f2 | cut -f1 -d-`
REV=a7ce052e3472

# no tag ? Let's use branch:
hg clone https://bitbucket.org/syntext/serna-free-4-3
GZIP=-9 hg archive -R serna-free-4-3 -r $REV -p serna-free-$VERSION serna-free_$VERSION.orig.tar.gz
