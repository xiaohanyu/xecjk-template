#!/usr/bin/env bash
# this script install texlive environment on different linux distributions

####################
# Current support for various linux distribution
# Redhat      No
# Fedora      No
# Slackware   No
# Gentoo      No
# SuSE        No
# Mandrake    No
# Debian      No
# Arch        Yes
####################

DIST=""

# check the distribution of linux
function linux_dist 
{
    if [ -f /etc/redhat-release ]
    then
        DIST="Redhat"
    elif [ -f /etc/fedora-release ]
    then
        DIST="Fedora"
    elif [ -f /etc/slackware-release ]
    then
        DIST="Slackware"
    elif [ -f /etc/gentoo-release ]
    then
        DIST="Gentoo"
    elif [ -f /etc/SuSE-release ]
    then
        DIST="SuSE"
    elif [ -f /etc/mandrake-release ]
    then
        DIST="Mandrake"
    elif [ -f /etc/debian_version ]
    then
        DIST="Debian"
    elif [ -f /etc/arch-release ]
    then
        DIST="Arch"
    fi
}

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

linux_dist

source confs/${DIST}.conf

$install_cmd $install_software
