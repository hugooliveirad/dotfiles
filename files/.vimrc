" Hugo's vimfiles

" Installs vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'arcticicestudio/nord-vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rails
Plug 'tpope/vim-rails'

" Cucumber
Plug 'tpope/vim-cucumber'

" Rspec
Plug 'thoughtbot/vim-rspec'

" JavaScript improvement
Plug 'ternjs/tern_for_vim'

" End vim-plug
call plug#end()

" General configs
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

let mapleader = "\<Space>"

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


" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
map <C-p> :FZF<CR>

" Colors
set background=dark
syntax enable
colorscheme nord

" Elm improvements
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

nnoremap ; :

" Search with AG
nnoremap <leader>a :Ag 

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
map  <leader>j <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-overwin-w)


" Toggles folding with space
nnoremap <leader>f za

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

