set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" ColorTheme Moloaki
Plugin 'tomasr/molokai'
" ColorTheme Gruvbox
Plugin 'morhetz/gruvbox'
" AirLine
Plugin 'bling/vim-airline'
"NerdTree
Plugin 'scrooloose/nerdtree'
" Surround
Plugin 'tpope/vim-surround'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
colorscheme gruvbox
set background:dark
set cursorline


" Tab
set tabstop=4
set shiftwidth=4
set expandtab

" Vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" NerdTree
map <C-n> :NERDTreeToggle<CR>

