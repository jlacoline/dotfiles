#!/bin/bash

DIR=$(dirname "$0")

# debian packages
sudo apt-get update
sudo apt-get -y install git vim tmux curl

# move all dotfiles
for f in .inputrc .vimrc .tmux.conf .dotfiles.bashrc; do
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
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/christoomey/vim-tmux-navigator.git
git clone https://github.com/pearofducks/ansible-vim.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/Shougo/deoplete.nvim.git
git clone https://github.com/deoplete-plugins/deoplete-jedi.git
git clone https://github.com/iamcco/markdown-preview.nvim.git
git clone https://github.com/noah/vim256-color.git
git clone https://github.com/chikamichi/mediawiki.vim.git
git clone https://github.com/roxma/nvim-yarp.git
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/roxma/vim-hug-neovim-rpc.git
git clone https://github.com/tsandall/vim-rego.git
git clone https://github.com/stephpy/vim-yaml.git

cd -

# thefuck
sudo apt-get -y install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
fuck
fuck

# python virtualenvs
sudo apt-get -y install python-pip
pip install virtualenvwrapper

# .bashrc update
if ! grep "# source jlacoline dotfiles" ~/.bashrc
then
  printf "\n# source jlacoline dotfiles\nsource ~/.dotfiles.bashrc" >> ~/.bashrc
fi

# some git configuration
git config --global user.email "jean.lacoline@gmail.com"
git config --global user.name "jlacoline"
git config --global core.editor "vim"
