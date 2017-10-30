call plug#begin('~/.config/nvim/plugged')

" plugins

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" set cwd to git repo root
Plug 'airblade/vim-rooter'

" highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

Plug 'flazz/vim-colorschemes'
Plug 'rust-lang/rust.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'
Plug 'rodjek/vim-puppet'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

nnoremap <C-L> :nohl<CR><C-L>

set novisualbell
set noerrorbells
set vb t_vb=
set laststatus=2
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile
set hidden

syntax enable
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set wildignore+=.git,node_modules,tmp
set wildmode=longest,list,full
set wildmenu

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
map <leader>v :e ~/.config/nvim/init.vim<CR>
map <C-p> :Files<CR>

" show tabs
set listchars=tab:▸\ 
set list

" jsx
let g:jsx_ext_required = 0
let g:ale_linters = { 'javascript': ['eslint', 'flow'], 'jsx': ['eslint', 'flow'], 'ruby': ['rubocop', 'mri'], 'eruby': ['erubis', 'rubocop'] }
let g:javascript_plugin_flow = 1

" finds the best eslint for the current file. since I have my cwd set to the git
" root, and sometimes projects within a monorepo have their own package.json
function! NearestEslint()
  let check_path = expand('%:p:h')
  while !executable(check_path . '/node_modules/.bin/eslint') && check_path != '/'
    let check_path = fnamemodify(check_path, ':h')
  endwhile

  if executable(check_path . '/node_modules/.bin/eslint')
    let b:syntastic_javascript_eslint_exec = check_path . '/node_modules/.bin/eslint'
  end
endfunction

autocmd BufWritePre *.js call NearestEslint()
autocmd BufWritePre *.jsx call NearestEslint()

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']

let g:puppet_align_hashes = 0

" show position in file
set ruler
set number
set showmatch
set cc=81

" color scheme
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors
set background=dark
colorscheme codeschool
let g:airline_theme="lucius"
let g:airline_powerline_fonts = 1

let g:netrw_dirhistmax=0
let g:syntastic_ruby_mri_exec = '~/.rbenv/shims/ruby'
let g:terminal_scrollback_buffer_size = 100000

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
autocmd BufRead,BufNewFile *.styl.erb setlocal filetype=stylus.eruby

hi statusline gui=none

set mouse=a
