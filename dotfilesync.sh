#!/bin/bash

COPYPATH="~/git/dotfiles"

cp -Rvf ~/.bashrc $COPYPATH/bashrc 
cp -Rvf ~/.dwmstart $COPYPATH/dwmstart 
cp -Rvf ~/.vimrc $COPYPATH/vimrc 
cp -Rvf ~/.Xdefaults $COPYPATH/Xdefaults 
cp -Rvf ~/.xinitrc $COPYPATH/xinitrc

git add .
git commit -m "update dotfiles"
git push -u orign master
