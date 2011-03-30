#!/usr/bin/env bash
# this script install xeCJK for you

# check user id
function check_uid 
{
    ROOT_UID=0
    if [ $UID -ne $ROOT_UID ]
    then
        echo "-> You must be root to run this script!"
        echo "-> type \"sudo $(basename $0)\" to run again"
        exit 1
    fi
}

check_uid

wget -c http://xecjk-template.googlecode.com/files/xeCJK.sty

cp xeCJK.sty /usr/share/texmf-dist/tex/xelatex/xecjk

rm -rf xeCJK.sty
