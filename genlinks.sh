#!/bin/bash
DF=~/.dotfiles
pushd ~
mkdir -p .backup
mv -n .bashrc .backup/
ln -s $DF/home/bashrc .bashrc
mv -n .gitconfig .backup/
ln -s $DF/home/gitconfig .gitconfig
mv -n .gitk .backup/
ln -s $DF/home/gitk .gitk
mv -n .inputrc .backup/
ln -s $DF/home/inputrc .inputrc
mv -n .minttyrc .backup/
ln -s $DF/home/minttyrc .minttyrc
mv -n .nanorc .backup/
ln -s $DF/home/nanorc .nanorc
mv -n .profile .backup/
ln -s $DF/home/profile .profile
mv -n .screenrc .backup/
ln -s $DF/home/screenrc .screenrc
mv -n .vimrc .backup/
ln -s $DF/home/vimrc .vimrc
ln -sf $DF/home/vim .vim
mv -n .tmux.conf .backup/
ln -s $DF/home/tmux.conf .tmux.conf

mkdir -p .ssh
mkdir -p .backup/ssh
mv -n .ssh/config .ssh/known_hosts .backup/ssh/
ln -s $DF/home/ssh/* .ssh/
popd
