#! /bin/sh

################################################################################
##     Copyright (c) 2020 Arsene Temfack                                      ##
##                                                                            ##
##     SPDX-License-Identifier: MIT                                           ##
################################################################################

CONFIG_S=./conf.d
CONFIG_D=~/.config/terminator

if [ "$#" -gt 1 ] || [ "$1" = "--help" ]; then
	echo "Usage: $0 [dir]\n --help  display this help and exit
The default directory is [$CONFIG_S]"; exit 1
fi

if [ "$#" = 1 ]; then
	CONFIG_S=$1
fi

if [ ! -d $CONFIG_S ]; then
	echo "Missing directory: $CONFIG_S\n    Use opion --help for help"; exit 1
fi

if [ -f "$CONFIG_S/terminator.conf" ]; then
	mkdir -p $CONFIG_D; cp $CONFIG_S/terminator.conf $CONFIG_D/config
else
	echo "Missing file: $CONFIG_S/terminator.conf"
fi
