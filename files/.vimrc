" Hugo's vimfiles

" Enable vim-plug
call plug#begin('~/.vim/plugged')

" Emmet vim
Plug 'mattn/emmet-vim'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Ag for searching projects
Plug 'rking/ag.vim'

" Repeat commands
Plug 'tpope/vim-repeat'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Git timemachine
Plug 'gregsexton/gitv'

" EasyMotion (like avy for emacs)
Plug 'easymotion/vim-easymotion'

" Undo tree
Plug 'mbbill/undotree'

" Surround
Plug 'tpope/vim-surround'

" Language extensions
Plug 'sheerun/vim-polyglot'

" Linting
Plug 'w0rp/ale'

" Colors
Plug 'joshdick/onedark.vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" End vim-plug
call plug#end()

" General configs
set encoding=utf-8
set wildmenu          " set vim menu
set expandtab
set tabstop=2
set shiftwidth=2
set hidden            " just hide the buffer when switching files
set ruler             " show cursor position
set hlsearch          " set highlight for search
set nowrap            " set no wrap for big lines
set textwidth=0
set wrapmargin=0
set autoindent        " set autoindent
set nobackup          " disable backup files
set nowritebackup     " disable backup files
set backspace=2       " backspace over everything
set ai
set incsearch
set scrolloff=3       " offsets the scroll when possible
set laststatus=2      " always shows the status line
set ignorecase        " case-insensitive search
set smartcase         " but case-sensitive if contains capital letter
set foldlevelstart=50 " Files open expanded
set foldmethod=indent " Use decent folding

" FZF options
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <C-p> :FZF<CR>

" Colors
syntax on
colorscheme onedark
let g:onedark_termcolors = 16

" Elm improvements
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_fix_on_save = 1


" Undo improvements
set undofile
set undodir=$HOME/.vim/undo " persist undo info here

set undolevels=1000
set undoreload=10000        " undo info survives reloads

" Show hidden chars, EOL, and trailing spaces
set list
set lcs=tab:»·
set lcs+=trail:·

" Map leaders
let mapleader = ','
let localmapleader = '\\'

" Toggles folding with space
nnoremap <Space> za

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
nmap <c-q> :wq<CR>
imap <c-q> <esc>:wq<CR>
vmap <c-q> <esc>:wq<CR>

