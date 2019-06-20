#!/bin/bash

cp -vf ~/.bashrc ~/git/dotfiles/bashrc 
cp -vf ~/.dwmstart ~/git/dotfiles/dwmstart 
cp -vf ~/.vimrc ~/git/dotfiles/vimrc 
cp -vf ~/.Xdefaults ~/git/dotfiles/Xdefaults 
cp -vf ~/.xinitrc ~/git/dotfiles/xinitrc

git add .
git commit -m "update dotfiles"
git push -u orign master
