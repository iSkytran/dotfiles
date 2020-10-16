" Plugin install
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on

" Visual options
syntax enable
set cursorline
set number
set relativenumber
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

" Keybindings
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <silent> <leader>m :set paste!<CR>
noremap <silent> <leader>t :NERDTreeToggle<CR>
noremap <silent> <leader>f :Ag<CR>
noremap <silent> <leader>F :Files<CR>
noremap <silent> <leader>h :noh<CR>
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :bd<CR>
noremap <silent> <leader>1 :1b<CR>
noremap <silent> <leader>2 :2b<CR>
noremap <silent> <leader>3 :3b<CR>
noremap <silent> <leader>4 :4b<CR>
noremap <silent> <leader>5 :5b<CR>
noremap <silent> <leader>6 :6b<CR>
noremap <silent> <leader>7 :7b<CR>
noremap <silent> <leader>8 :8b<CR>
noremap <silent> <leader>9 :9b<CR>
noremap <silent> <leader>0 :10b<CR>

" Theme options
colorscheme gruvbox-material
set background=dark
let g:gruvbox_material_background = 'soft'

" Airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#ale#enabled = 1

" NERDTree options
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter options
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

