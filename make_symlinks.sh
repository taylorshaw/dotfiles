#!/usr/bin/env bash

# Symlink files to homedir
files=(cshrc emacs.d emacs-custom.el bash_aliases)
# add gitconfig and gitignore for home use. different one for aurora.

for file in ${files[*]}; do
    target=`pwd`/${file}
    dotfile=~/.${file}
    if [ ! -L $dotfile ]; then
	ln -s ${target} ${dotfile}
	echo Linked ${dotfile} to {$target}
    else
	echo Link for ${dotfile} already exists!
    fi
done
