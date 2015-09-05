#!/bin/bash
#
# Set up emacs config file from git repository.
#
# Author: Andreas Schroeder <andreas@a-netz.de>
#

LOC=`dirname $0`

if [ -f ~/.emacs ]
then
    echo "There is already a '.emacs' file. Renaming to '.emacs.bak'."
    mv ~/.emacs ~/.emacs.bak
elif [ -L ~/.emacs ]
then
    echo "'.emacs' is a link. Replacing it."
    rm ~/.emacs    
fi

echo "Creating link to '~/.emacs'."
ln -s ${LOC}/.emacs ~/.emacs

if [ ! -d ~/.emacs.d ]
then
    echo "Creating directory '~/.emacs.d'."
    mkdir ~/.emacs.d
fi

echo "Copying files to '~/.emacs.d'."
cp -v ${LOC}/.emacs.d/* ~/.emacs.d
