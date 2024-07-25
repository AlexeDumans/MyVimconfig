#!/bin/bash 


echo "vin global installing..."

sudo apt install vim vim-gtk ack

MyVim = 'pwd -P'

cd $HOME

function digitaldatetime() {
    echo `date +"%Y%m%d%H%M%S"`
}

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.`digitaldatetime`\033[0m";
    mv ~/.vimrc ~/.vimrc.`digitaldatetime`;
fi

if [ -d ~/.vim ]; then
    echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32mBacking up to ~/.vim.`digitaldatetime`\033[0m";
    mv ~/.vim ~/.vim.`digitaldatetime`;
fi

echo "\033[0;36mCopying .vimrc and .vim\033[0m"
echo "\033[0;32mln -s ${MyVim}/.vimrc .vimrc\033[0m"
ln -s ${MyVim}/.vimrc .vimrc
echo "\033[0;32mln -s ${MyVim}/.vim .vim\033[0m"
ln -s ${MyVim}/.vim .vim
