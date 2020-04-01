" Hugo's vimfiles

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'arcticicestudio/nord-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" End vim-plug
call plug#end()

let mapleader = "\<Space>"

" General configs
set number
set nocompatible      " remove compatibility quirks
set modelines=0       " prevents security exploits
set encoding=utf-8
set wildmenu          " set vim menu
set wildmode=list:longest
set expandtab
set tabstop=2
set shiftwidth=2
set hidden            " just hide the buffer when switching files
set ruler             " show cursor position
set textwidth=0
set wrapmargin=0
set autoindent
set backspace=2       " backspace over everything
set ai
set scrolloff=3       " offsets the scroll when possible
set laststatus=2      " always shows the status line
set foldlevelstart=50 " files open expanded
set foldmethod=indent " use decent folding
set list              " show hidden chars, EOL, and trailing spaces
set lcs=tab:»·,trail:·


set ignorecase        " case-insensitive search
set smartcase         " but case-sensitive if contains capital letter
set incsearch
set gdefault
set showmatch
set hlsearch          " set highlight for search
nnoremap <leader>c :noh<cr>

set noswapfile
set nobackup          " disable backup files
set nowritebackup     " disable backup files
set undofile
set undodir=$HOME/.vim/undo " persist undo info here
set undolevels=1000
set undoreload=10000        " undo info survives reloads

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

filetype plugin indent on

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <C-p> :FZF<CR>

" set Vim-specific sequences for RGB colors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax enable
color nord
set background=dark

let g:ale_fixers = {'javascript.jsx': ['prettier'], 'javascript': ['prettier']}
let g:ale_linters = {'javascript.jsx': ['eslint'], 'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1

" Easy commands
nnoremap ; :

" Search with AG
nnoremap <leader>a :Ag 

" Directory navigation bindings
nnoremap <leader>- :Hex<cr>
nnoremap <leader>\ :Vex<cr>
nnoremap <leader>. :Ex<cr>

" Tab navigation bindings
nnoremap <End> gT
nnoremap <Home> gt

" Edit vimrc
nnoremap <leader>ev :tabe $HOME/.vimrc<cr>

" Splitting bindings
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Fugitive bindings
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>gdd :Gdiff<cr>
nnoremap <leader>gdm :Gdiff origin/master<cr>

" Easymotion bidings
map  <leader>j <Plug>(easymotion-bd-f)
map , <Plug>(easymotion-bd-f)

" Navigation bindings
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Saving bindings
nmap <c-s> :w<CR>
imap <c-s> <esc>:w<CR>
vmap <c-s> <esc>:w<CR>

" Closing bindings
nmap <c-q> :q<CR>
imap <c-q> <esc>:q<CR>
vmap <c-q> <esc>:q<CR>

