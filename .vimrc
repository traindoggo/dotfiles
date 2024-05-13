" bindings
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap <silent> jk <ESC>


" display
set fenc=utf-8
set number relativenumber
set virtualedit=onemore
set smartindent
set showmatch

set nobackup
set noswapfile
set autoread
set hidden
set nowrap
set showcmd
set nocompatible
set wildmenu
set wildmode=longest:list,full


" move
set whichwrap=b,s,h,l,<,>,[,],~


" cursor
let &t_TI .= "\e[2 q" " when enter into vim
let &t_EI .= "\e[2 q" " normal mode
let &t_SI .= "\e[5 q" " insert mode
let &t_TE .= "\e[4 q" " when exit from vim


" editor
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus


" search
set ignorecase
set incsearch
set smartcase
set wrapscan
set hlsearch
nnoremap <ESC><ESC> :nohl<CR>

filetype indent plugin on
