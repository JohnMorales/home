#!/bin/bash
SCRIPT_DIR=`pwd -P`
VIMPLUGINDIR=~/.vim/bundle
mkdir -p ~/.vim/autoload $VIMPLUGINDIR;\
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
mkdir -p $VIMPLUGINDIR
test -d $VIMPLUGINDIR/ctrlp.vim || git clone https://github.com/kien/ctrlp.vim.git $VIMPLUGINDIR/ctrlp.vim
test -d $VIMPLUGINDIR/jellybeans.vim || git clone https://github.com/nanotech/jellybeans.vim.git $VIMPLUGINDIR/jellybeans.vim
test -d $VIMPLUGINDIR/nerdtree.vim || git clone https://github.com/scrooloose/nerdtree.git $VIMPLUGINDIR/nerdtree.vim
link_config_file() {
file=$1
if [ ! -L ~/.$file ]; then
  echo "creating backup of exiting file to .$file.bak"
  [ -f ~/.$file ] && mv ~/.$file ~/.$file.bak
  ln -s $SCRIPT_DIR/$file ~/.$file
fi
}
FILES=(vimrc bashrc gemrc gitconfig gitignore tmux.conf bash_profile)
for i in ${FILES[@]} 
  do 
    link_config_file $i; 
  done
