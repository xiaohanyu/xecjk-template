#!/usr/bin/env bash

# software version
VERSION=$1

# clean uncessary temporary files
make -f tex/Makefile cleanall

tar czvf xecjk-template-${VERSION}.tar.gz tex
tar czvf xecjk-template-all-${VERSION}.tar.gz CHANGES README LICENSE IDEs scripts tex
