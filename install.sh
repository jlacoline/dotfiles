#!/bin/bash

DIR=$(dirname "$0")

# debian packages
sudo apt-get update
sudo apt-get -y install git vim tmux curl

# move all dotfiles
for f in .inputrc .vimrc .tmux.conf; do
    cp "$DIR/$f" ~
done

# vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/vim-scripts/mayansmoke.git
git clone https://github.com/python-mode/python-mode.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/kien/ctrlp.vim.git
cd -

# thefuck
sudo apt-get -y install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
fuck
fuck

# python virtualenvs
sudo apt-get -y install python-pip
sudo pip install virtualenvwrapper
if ! grep "# source virtualenvwrapper script" ~/.bashrc
then
  printf "\n# source virtualenvwrapper script\nsource /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
fi

# some git configuration
git config --global user.email "jean.lacoline@gmail.com"
git config --global user.name "jlacoline"
git config --global core.editor "vim"
