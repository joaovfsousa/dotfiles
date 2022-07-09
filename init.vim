set nocompatible

syntax on

" General setting
set hidden
set number
set relativenumber
set noerrorbells visualbell t_vb=
set wrap
set mouse=a
set wildmenu                " Opção de autocompletar com o tab as opções do vim em comand-line
set directory=~/.vim/tmp,   " Salva os arquivos de sessão do vim em um diretório à parte
set backupdir=~/.vim/tmp,   " Salva os arquivos de sessão do vim em um diretório à parte

" Search options
set incsearch           " Incremental search
set ignorecase          
set hlsearch            " Highlight search
set smartcase           " If all chars lowercase ignore case in search
set inccommand=split

" Tabs and spaces
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2


set shortmess+=I
set laststatus=2
set backspace=indent,eol,start

set autoindent
set splitbelow
set splitright
set encoding=utf-8
set clipboard=unnamed

nmap q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

noremap <C-k> 2<C-y>
noremap <C-j> 2<C-e>

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


