call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
let g:airline_theme='onedark'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'

Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'

Plug 'tpope/vim-surround'

Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'dense-analysis/ale'

call plug#end()

set noshowmode
set nocompatible
filetype indent plugin on
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set softtabstop=4
set expandtab
colorscheme onedark
