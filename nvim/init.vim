call plug#begin('~/.config/nvim/plugged')

" plugins
Plug 'kien/ctrlp.vim'

" set cwd to git repo root
Plug 'airblade/vim-rooter'

" highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

Plug 'flazz/vim-colorschemes'
Plug 'rust-lang/rust.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'

call plug#end()

nnoremap <C-L> :nohl<CR><C-L>

set novisualbell
set noerrorbells
set vb t_vb=
set laststatus=2

set nobackup
set nowritebackup
set noswapfile

syntax enable
filetype plugin indent on

set wildignore+=.git,node_modules,tmp

let mapleader=","
map <leader>a :Ag<space>
map <leader>t :tabnew<CR>

map <leader>sh :leftabove vnew<CR>
map <leader>sl :rightbelow vnew<CR>
map <leader>sk :leftabove new<CR>
map <leader>sj :rightbelow new<CR>

map <leader>swh :topleft vnew<CR>
map <leader>swl :botright vnew<CR>
map <leader>swk :topleft new<CR>
map <leader>swj :botright new<CR>

" show tabs
set listchars=tab:▸\ 
set list

" show position in file
set ruler
set number
set showmatch
set cc=81

" color scheme
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme codeschool

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" always use my tab width settings
autocmd BufNewFile,BufRead * set shiftwidth=2
autocmd BufNewFile,BufRead * set tabstop=2
autocmd BufNewFile,BufRead * set softtabstop=2
autocmd BufNewFile,BufRead * set expandtab

" ...except in rust
autocmd BufNewFile,BufRead *.rs set shiftwidth=4
autocmd BufNewFile,BufRead *.rs set tabstop=4
autocmd BufNewFile,BufRead *.rs set softtabstop=4
