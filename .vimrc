set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ColorTheme 
Plugin 'morhetz/gruvbox'

" AirLine
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
set nu
set relativenumber
colorscheme gruvbox
set background:dark
set cursorline
let g:gruvbox_termcolors=16
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

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

