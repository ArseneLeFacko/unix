#! /bin/sh

if [ "$#" -gt 1 ]; then
	echo "Too many arguments.\n	Usage: bash.sh [dir]"
	exit
fi

if [ "$1" = "--help" ]; then
	echo "Usage: bash.sh [dir]\n	--help  display this help and exit
The default directory is [../conf.d/]"
	exit
fi

if [ "$#" = 1 ]; then
	CONFIG_D=$1
else
	CONFIG_D=../conf.d
fi

if [ ! -d $CONFIG_D ]; then
	echo "Missing directory: $CONFIG_D\n	Use opion --help for help"
	exit
fi

if [ -f $CONFIG_D/bashrc ]; then
	cp $CONFIG_D/bashrc ~/.bashrc
else
	echo "Missing file: $CONFIG_D/bashrc"
fi

if [ -f $CONFIG_D/bash_aliases ];then
	cp $CONFIG_D/bash_aliases ~/.bash_aliases
else
	echo "Missing file: $CONFIG_D/bash_aliases"
fi

if [ -f $CONFIG_D/bash_fancy ];then
	cp $CONFIG_D/bash_fancy ~/.bash_fancy
else
	echo "Missing file: $CONFIG_D/bash_fancy"
fi
