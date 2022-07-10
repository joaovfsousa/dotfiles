call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chun-yang/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'ervandew/supertab'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'
call plug#end()

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

nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>pi :PlugInstall<cr>

" Misc
nnoremap ; :
vnoremap ; :

" Move to end of line
nnoremap q $
vnoremap q $

" Fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

" NerdTree
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <c-b> :NERDTreeFocus<CR>

autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Add to end of line
nnoremap <leader>; A;<esc>
nnoremap <leader>: A:<esc>
nnoremap <leader>, A,<esc>
nnoremap <leader>. A.<esc>
nnoremap <leader>) A)<esc>
nnoremap <leader>} A}<esc>
nnoremap <leader>] A]<esc>

nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-w> <c-w>w

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gb :e#<enter>

nmap <c-_> gcc
vmap <c-_> gc

let g:airline_theme='night_owl'
let g:floaterm_keymap_toggle = '<leader>T'

