set nocompatible	" be improved, required
" filetype off		" required

" Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
call plug#end()

syntax on
set nu
" set relativenumber
colorscheme plan9
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

" Vim LightLine
set laststatus=2
let g:lightline = { 'colorscheme': 'PaperColor', }


" NerdTree
map <C-n> :NERDTreeToggle<CR>
