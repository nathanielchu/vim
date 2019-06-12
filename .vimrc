" Configuration

" Pathogen first
" execute pathogen#infect()

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Basic Settings

filetype plugin indent on
syntax on
set shell=/bin/bash
set guifont=Menlo:h14
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
" set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set noundofile
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set linebreak
set nolist
set formatoptions=qrn1
" set spell spelllang=en_us
set colorcolumn=80

" Aesthetics

" colorscheme solarized
" set background=light

" Mappings and shortcuts

" Basics

inoremap jk <ESC>
let mapleader = ","

" Miscellaneous

vnoremap . :norm.<CR>

" source
so ~/.vim/plugins.vim

" fzf
" control p for Files
nnoremap <C-p> :Files<Cr>
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" Insert mode fzf complete file ag
imap <c-x><c-j> <plug>(fzf-complete-file-ag)

" lightline powerline configuration
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ }
set background=dark

" coc configuration
set updatetime=300

" vim splits
set splitbelow
set splitright

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" gutentags configuration
let g:gutentags_cache_dir = expand('~/.cache/tags')

