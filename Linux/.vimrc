" Plugin install
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()

" Visual options
syntax enable
set number relativenumber
set cursorline
set noshowmode

" Quality of life options
set hidden
set mouse=a

" Search options
set ignorecase
set smartcase

" Indent options
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Wildmenu
set wildmenu
set wildmode=full

" Theme options
if has('termguicolors')
    set termguicolors
endif
set background=dark
colorscheme gruvbox-material

" Airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox_material'

