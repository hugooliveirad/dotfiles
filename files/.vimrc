" Hugo's vimfiles

" Enable vim-plug
call plug#begin('~/.vim/plugged')

" Sensible configs
Plug 'tpope/vim-sensible'

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

" Ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" End vim-plug
call plug#end()

" Ctrlp options
let g:ctrlp_show_hidden = 1

" Colors
syntax on
set background=dark
colorscheme onedark

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Elm improvements
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1


" Undo improvements
set undofile
set undodir=$HOME/.vim/undo " persist undo info here

set undolevels=1000
set undoreload=10000        " undo info survives reloads

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

