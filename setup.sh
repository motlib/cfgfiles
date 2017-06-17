#!/bin/bash
#
# Set up user config files from git repository.
#
# Author: Andreas Schroeder <andreas@a-netz.de>
#

# List of files to install
CFGFILES=".emacs .emacs.d .tmux.conf .gitconfig"


CFGDIR=`dirname $0`

function install_file() {
    echo "Installing '$1'."
    [ -e "$0" ] && (
        echo "  File '$1' exists. Moving to '$1.bak'.";
        mv "$1" "$1.bak"
    )

    ln -s "${CFGDIR}/$1"
}

for CFGFILE in ${CFGFILES}
do
    install_file ${CFGFILE}
done
