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

wget -c http://xecjk-template.googlecode.com/files/cjk_fonts.tar.gz

fonts_dir=/usr/share/fonts/xecjk_fonts 

mkdir ${fonts_dir}

tar xzvf cjk_fonts.tar.gz -C ${fonts_dir}

# build system fonts information
mkfontscale
mkfontdir
fc-cache -fv

if [ $? -eq 0 ]
then
    echo "-> Fonts install successfully"
    echo "-> You can type 'fc-list :lang=zh' to view a list of cjk fonts in your system"
fi

rm -f cjk_fonts.tar.gz
