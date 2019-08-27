#!/bin/bash
set -e

CONFIG=$(dirname $0)/vimrcs/.vimrc
VIMRC=$HOME/.vimrc
ERROR="Failed to install standard VimRC! :-("

if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
    cd $HOME/.vim/bundle/Vundle.vim
    git pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cat $CONFIG > $VIMRC || { echo $ERROR; exit 1; }
echo "Installed standard VimRC successfully! Enjoy :-)"

