" General Settings
let mapleader = "\<Space>"

set autoread
set backup
set backupdir=/tmp//,.
set clipboard=unnamed
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
set pastetoggle=<F2>
set shell=$SHELL
set smartcase
set smartindent
set undodir=/tmp//,.
set undofile

augroup vimrc
  autocmd!
augroup END

" Spell check
autocmd vimrc FileType gitcommit,markdown setlocal spell

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
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'reedes/vim-pencil'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'svermeulen/vim-easyclip'
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

" base16-vim
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" fzf.vim
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" goyo.vim, limelight.vim, vim-pencil
let g:pencil#wrapModeDefault = 'soft'
autocmd! User GoyoEnter Limelight | Pencil
autocmd! User GoyoLeave Limelight! | NoPencil
nnoremap <leader>G :Goyo<CR>

" nerdtree
let NERDTreeQuitOnOpen = 1
nnoremap <leader>n :NERDTreeToggle<CR>

" rainbow_parentheses.vim
autocmd vimrc FileType * RainbowParentheses 

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" vim-fugitive
nmap <Leader>g :Gstatus<CR>gg<c-n>

" vim-signify
let g:signify_vcs_list = ['git']

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
