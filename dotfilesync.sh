#!/bin/bash

COPYPATH='~/git/dotfiles'
cp -vfp ~/.bashrc "$COPYPATH/bashrc" 
cp -vf ~/.dwmstart $COPYPATH/dwmstart 
cp -vf ~/.vimrc $COPYPATH/vimrc 
cp -vf ~/.Xdefaults $COPYPATH/Xdefaults 
cp -vf ~/.xinitrc $COPYPATH/xinitrc

git add .
git commit -m "update dotfiles"
git push -u orign master
