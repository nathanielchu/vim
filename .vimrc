" Configuration
" Use Vim settings, rather than Vi settings
" This must be set first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================
syntax on
set shell=/bin/bash
set guifont=Menlo:h14
set encoding=utf-8
set hidden
set ttyfast

set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0              "Disable cursor blink
set mouse=nvi                   "Enable mouse
set autoread                    "Reload files changed outside vim
set laststatus=2
set modelines=0
set pastetoggle=<F2>

set wrap
set linebreak
set formatoptions=qrn1
set ruler
" set colorcolumn=80
" set visualbell
" set spell spelllang=en_us

" ================ Mappings ====================

let mapleader = ","
inoremap jk <ESCi>
" Tab to move to associated (), {}, []
nnoremap <tab> %
vnoremap <tab> %
vnoremap . :norm.<CR>

" ================ Gutter line numbers ====================
set number
set relativenumber

" ================ Centralize meta files ==============
silent !mkdir ~/.vim/backups > /dev/null 2>&1
silent !mkdir ~/.vim/swaps > /dev/null 2>&1

set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" ================ Persistent Undo ==================
" Keep undo history across sessions by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·
" set list listchars=tab:»·,trail:·,nbsp:·
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

" Start scrolling wen we're 3 lines away from margins
set scrolloff=3

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set gdefault        " Add the g flag to search/replace by default
set showmatch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" ================ Aesthetics ===========================

set background=dark

" source config file form vim plugins
so ~/.vim/plugins.vim

