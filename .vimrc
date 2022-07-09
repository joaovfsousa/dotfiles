set nocompatible
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
nmap q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb=
set mouse+=a

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

set expandtab
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2

nnoremap ; :
vnoremap ; :
nnoremap q $
vnoremap q $
inoremap <expr> <C-J> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-K> ((pumvisible())?("\<C-p>"):("k"))
set splitbelow
set splitright
set encoding=utf-8
set clipboard=unnamed
