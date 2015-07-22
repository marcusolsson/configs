#!/bin/bash 

sudo apt-get -qq update
sudo apt-get -qq upgrade

packages=(
	i3 nitrogen
	volumeicon-alsa python3-udiskie
	lxappearance gtk-chtheme qt4-qtconfig
	ranger gpicview
	vim git gnome-terminal 
	htop curl jq
)

sudo apt-get install -qq ${packages[*]}

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YouCompleteMe
sudo apt-get install -qq build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
