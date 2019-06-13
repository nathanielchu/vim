" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'

call plug#end()

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

" ale configuration
let g:ale_linters = {'cpp': ['clang'], 'java': [], 'yaml': [], 'scala': [], 'clojure': []}
let g:ale_lint_delay = 1000
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
