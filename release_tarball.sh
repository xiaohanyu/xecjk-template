#!/usr/bin/env bash

VERSION=$1

tar czvf xecjk-template-${VERSION}.tar.gz tex
tar czvf xecjk-template-all-${VERSION}.tar.gz CHANGES README LICENSE IDEs scripts tex
