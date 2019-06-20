#!/bin/bash

COPYPATH="~/git/dotfiles"

cp -Rvf $HOME/.bashrc $COPYPATH/bashrc 
cp -Rvf $HOME/.dwmstart $COPYPATH/dwmstart 
cp -Rvf $HOME/.vimrc $COPYPATH/vimrc 
cp -Rvf $HOME/.Xdefaults $COPYPATH/Xdefaults 
cp -Rvf $HOME/.xinitrc $COPYPATH/xinitrc

git add .
git commit -m "update dotfiles"
git push -u orign master
