#!/bin/bash
pushd ~
rm -f .bashrc && ln -s dotfiles/bashrc .bashrc
rm -f .gitconfig && ln -s dotfiles/gitconfig .gitconfig
rm -f .gitk && ln -s dotfiles/gitk .gitk
rm -f .inputrc && ln -s dotfiles/inputrc .inputrc
rm -f .minttyrc && ln -s dotfiles/minttyrc .minttyrc
rm -f .nanorc && ln -s dotfiles/nanorc .nanorc
rm -f .profile && ln -s dotfiles/profile .profile
rm -f .screenrc && ln -s dotfiles/screenrc .screenrc
rm -f .viminfo && ln -s dotfiles/viminfo .viminfo
popd
