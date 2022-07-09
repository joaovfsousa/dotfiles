syntax on
set nocompatible
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
set noerrorbells visualbell t_vb=
set mouse+=a
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2
set splitbelow
set splitright
set encoding=utf-8
set clipboard=unnamed

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
nnoremap ; :
vnoremap ; :
nnoremap q $
vnoremap q $
inoremap <expr> <C-J> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-K> ((pumvisible())?("\<C-p>"):("k"))

nmap q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

