call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'arcticicestudio/nord-vim'
Plug 'elixir-editors/vim-elixir'

Plug 'christoomey/vim-tmux-navigator'

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

filetype plugin indent on

set termguicolors
let ayucolor="mirage"
syntax enable
colorscheme ayu

" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nmap <silent> <C-p> :FZF<CR>

" coc

" trigger on tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" remap for rename current word
nmap <F2> <Plug>(coc-rename)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set updatetime=300 " longer updatetime provides poor user experience
set shortmess+=c   " don't pass messages to ins-completion-menu
set signcolumn=yes " always show so that code is not jumping around

" Easy commands
nnoremap ; :

" Directory navigation bindings
nnoremap <leader>- :split<cr>
nnoremap <leader>\ :vsplit<cr>

" Directory navigation bindings
nnoremap <leader>. :NERDTreeFind<cr>

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

