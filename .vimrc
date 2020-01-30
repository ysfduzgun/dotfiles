set nocompatible	" be improved, required

" Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'ewilazarus/preto'
call plug#end()

filetype plugin indent on

set nu
syntax enable
colorscheme preto
set showmatch

set tabstop=4
set shiftwidth=4
set expandtab
set cursorline


" enable all Python syntax highlighting features
let python_highlight_all = 1

" Vim LightLine
set laststatus=2
let g:lightline = { 'colorscheme': 'PaperColor', }

" NerdTree
map <C-n> :NERDTreeToggle<CR>
