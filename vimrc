" General Settings
let mapleader = "\<Space>"

set autoread
set backup
set backupdir=/tmp//,.
set clipboard=unnamed
set colorcolumn=+1
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

augroup vimrc
  autocmd!
augroup END

" Remap jj to <Esc>
inoremap jj <Esc>

" Spell check
autocmd vimrc FileType gitcommit,markdown setlocal spell

" Plugins (junegunn/vim-plug)
call plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
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

" nerdtree
let NERDTreeQuitOnOpen = 1
nnoremap <leader>n :NERDTreeToggle<CR>

" rainbow_parentheses.vim
autocmd vimrc FileType * RainbowParentheses

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" vim-fugitive
nmap <Leader>g :Gstatus<CR>gg<c-n>

" vim-signify
let g:signify_vcs_list = ['git']

" https://sunaku.github.io/tmux-yank-osc52.html
" copy the current text selection to the system clipboard
if has('gui_running') || has('nvim') && exists('$DISPLAY')
  noremap <Leader>y "+y
else
  " copy to attached terminal using the yank(1) script:
  " https://github.com/sunaku/home/blob/master/bin/yank
  noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
