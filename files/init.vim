call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'samoshkin/vim-mergetool'

Plug 'jreybert/vimagit'

Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elixir-editors/vim-elixir'

" Prose plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'Pocco81/HighStr.nvim'

Plug 'Shatur/neovim-ayu'
Plug 'morhetz/gruvbox'

" Tmux integration
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
set textwidth=0       " disable auto wrapping of code
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

set noswapfile
set nobackup          " disable backup files
set nowritebackup     " disable backup files
set undofile
set undodir=$HOME/.vim/undo " persist undo info here
set undolevels=1000
set undoreload=10000        " undo info survives reloads

filetype plugin indent on

" Ayu Colorscheme
lua << EOF
require('ayu').setup({
    mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {}, -- A dictionary with a group names associated with a dictionary with parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
EOF

set termguicolors
let ayucolor="mirage"
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_sign_column="bg0"
let g:gruvbox_bold=0
let g:gruvbox_invert_selection=0
syntax enable
colorscheme gruvbox
set background=dark


nnoremap <leader>c :noh<cr>

" Markdown
autocmd BufNewFile,BufRead *.md setlocal linebreak
let g:markdown_fenced_languages = ['html', 'bash=sh', 'javascript', 'js=javascript', 'css']

nnoremap <leader>m :Goyo<cr>

function! s:goyo_enter()
  set linebreak

  " remap navigation keys to move along wrapped lines
  noremap <buffer> k gk
  noremap <buffer> j gj
  noremap <buffer> 0 g0
  noremap <buffer> $ g$
  set scrolloff=0
endfunction

function! s:goyo_leave()
  set linebreak!
  unmap <buffer> k
  unmap <buffer> j
  unmap <buffer> 0
  unmap <buffer> $
  set scrolloff=3
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" HighStr
vmap <leader>hh :<c-u>HSHighlight 1<CR>
vmap <leader>h0 :<c-u>HHSHighlight 0<cr>
vmap <leader>h1 :<c-u>HSHighlight 1<cr>
vmap <leader>h2 :<c-u>HSHighlight 2<cr>
vmap <leader>h3 :<c-u>HSHighlight 3<cr>
vmap <leader>h4 :<c-u>HSHighlight 4<cr>
vmap <leader>hr :<c-u>HSRmHighlight<cr>
nnoremap <leader>ha :<c-u>HSRmHighlight rm_all<cr>

" MDX
autocmd BufNewFile,BufRead *.mdx set filetype=markdown.javascript

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'

" fzf
"let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"nmap <silent> <C-p> :FZF<CR>

" telescope
nmap <silent> <C-p> :Telescope git_files<CR>
nmap <silent> <C-y> :Telescope buffers<CR>
nnoremap <leader>b :Telescope buffers<CR>

nnoremap <leader>tf :Telescope find_files<cr>
nnoremap <leader>tg :Telescope live_grep<cr>
nnoremap <leader>ta :Telescope grep_string<cr>

nnoremap <leader>gb :Telescope git_branches<cr>
nnoremap <leader>gc :Telescope git_commits<cr>

lua require('telescope').load_extension('fzf')

lua << EOF
local actions = require "telescope.actions"

require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
       width = 0.95,
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Esc>"] = "close",
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  },
})
EOF

" coc

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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" remap for rename current word
nmap <F2> <Plug>(coc-rename)

" show signature help in insert mode
inoremap <silent> <F1> <C-r>=CocActionAsync('showSignatureHelp')<CR>

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <leader>f :CocFix<cr>
nnoremap <leader>o :CocList outline<cr>
nnoremap <silent><nowait> <space>x  :<C-u>CocList commands<cr>

set updatetime=300 " longer updatetime provides poor user experience
set shortmess+=c   " don't pass messages to ins-completion-menu
set signcolumn=number " always show so that code is not jumping around

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
nnoremap <leader>ev :tabe $HOME/.config/nvim/init.vim<cr>

" Splitting bindings
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Fugitive bindings
"nnoremap <leader>gs :NERDTreeClose<cr>:Git<cr>
nnoremap <leader>gdd :Gdiffsplit<cr>
nnoremap <leader>gdm :Gdiffsplit origin/main<cr>
nnoremap <leader>gdn :Gdiffsplit origin/master<cr>

" Vimagit Config and bindings
nnoremap <leader>gs :Magit<cr>

" GitGutter bindings
nnoremap <leader>ghn :GitGutterNextHunk<cr>
nnoremap <leader>ghp :GitGutterPrevHunk<cr>

" Easymotion bidings
map  <leader>j <Plug>(easymotion-bd-f)
map , <Plug>(easymotion-bd-f)

" Restore older vim Y behavior (copy entire line)
nmap Y yy

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

