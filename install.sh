#!/bin/bash 

echo "Vim global installing..."

sudo apt install vim vim-gtk ack
git submodule update --init --recursive

MyVim=`pwd -P`

cd $HOME

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Found ~/.vimrc. Backing up to ~/.vimrc_copy";
    mv ~/.vimrc ~/.vimrc_copy;
fi

if [ -d ~/.vim ]; then
    echo "Found ~/.vim. Backing up to ~/.vim_copy";
    mv ~/.vim ~/.vim_copy;
fi

echo "Copying .vimrc and .vim"
echo "ln -s ${MyVim}/.vimrc .vimrc"
ln -s ${MyVim}/.vimrc .vimrc
echo "ln -s ${MyVim}/.vim .vim"
ln -s ${MyVim}/.vim .vim
