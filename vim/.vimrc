" General Settings
set autoread
set backup
set backupdir=/tmp//,.
set clipboard=unnamed
if has('unnamedplus')
  set clipboard+=unnamedplus
endif
if exists('&colorcolumn')
  set colorcolumn=+1
endif
set directory=/tmp//,.
set expandtab
set hidden
set hlsearch
set ignorecase
set mouse=a
set nojoinspaces
set number
set pastetoggle=<F12>
set shell=$SHELL
set smartcase
set smartindent
set undodir=/tmp//,.
set undofile

" Plugins (junegunn/vim-plug)
call plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
if isdirectory($ZPLUG_REPOS . '/junegunn/fzf')
  Plug $ZPLUG_REPOS . '/junegunn/fzf'
else
  Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" Key Remappings
let mapleader = "\<Space>"
nnoremap <leader>s :update<CR>
nnoremap <leader>q :quit<CR>

" base16-vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

" rainbow
let g:rainbow_active = 1

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" vim-fugitive
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nmap <Leader>gs :Gstatus<CR>gg<c-n>

" vim-signify
let g:signify_vcs_list = ['git']

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
