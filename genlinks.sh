#!/bin/bash
pushd ~
mkdir -p .backup
mv -n .bashrc .backup/
ln -s ~/dotfiles/home/bashrc .bashrc
mv -n .gitconfig .backup/
ln -s ~/dotfiles/home/gitconfig .gitconfig
mv -n .gitk .backup/
ln -s ~/dotfiles/home/gitk .gitk
mv -n .inputrc .backup/
ln -s ~/dotfiles/home/inputrc .inputrc
mv -n .minttyrc .backup/
ln -s ~/dotfiles/home/minttyrc .minttyrc
mv -n .nanorc .backup/
ln -s ~/dotfiles/home/nanorc .nanorc
mv -n .profile .backup/
ln -s ~/dotfiles/home/profile .profile
mv -n .screenrc .backup/
ln -s ~/dotfiles/home/screenrc .screenrc

mkdir -p .ssh
mkdir -p .backup/ssh
mv -n .ssh/config .ssh/known_hosts .backup/ssh/
ln -s ~/dotfiles/home/ssh/* .ssh/
popd
