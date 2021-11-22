set nocompatible	" be improved, required

" Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Color
syntax on
set t_Co=256
set cursorline
set termguicolors
" colorscheme onehalflight
colorscheme onehalfdark
" lightline
set laststatus=2
let g:lightline = { 'colorscheme': 'one' }

filetype plugin indent on
set nu
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

" enable all Python syntax highlighting features
let python_highlight_all = 1

" NerdTree
map <C-n> :NERDTreeToggle<CR>
