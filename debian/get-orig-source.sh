#!/bin/sh

# sudo apt-get install mercurial

VERSION=4.3.0

# no tag ? Let's use branch:
hg clone https://bitbucket.org/syntext/serna-free-4-3

GZIP=-9 tar cfz serna-free_$VERSION.orig.tar.gz serna-free-4-3
