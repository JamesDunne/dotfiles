#!/bin/bash
pushd ~
rm -f .bashrc && ln -s ~/dotfiles/home/bashrc .bashrc
rm -f .gitconfig && ln -s ~/dotfiles/home/gitconfig .gitconfig
rm -f .gitk && ln -s ~/dotfiles/home/gitk .gitk
rm -f .inputrc && ln -s ~/dotfiles/home/inputrc .inputrc
rm -f .minttyrc && ln -s ~/dotfiles/home/minttyrc .minttyrc
rm -f .nanorc && ln -s ~/dotfiles/home/nanorc .nanorc
rm -f .profile && ln -s ~/dotfiles/home/profile .profile
rm -f .screenrc && ln -s ~/dotfiles/home/screenrc .screenrc
popd
