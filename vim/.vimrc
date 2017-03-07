" General Settings
set shell=$SHELL
set pastetoggle=<F12>
if exists('&colorcolumn')
  set colorcolumn=+1
endif

" Plugins (junegunn/vim-plug)
call plug#begin()
if isdirectory($ZPLUG_REPOS.'/junegunn/fzf')
  Plug $ZPLUG_REPOS.'/junegunn/fzf'
else
  Plug 'junegunn/fzf'
endif
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" Key Remappings
map <space> <leader>
nnoremap <leader>s :write<CR>

" fzf.vim
nnoremap <leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>

" matchit.vim
runtime macros/matchit.vim

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" vim-airline
let g:airline_powerline_fonts=1

" vim-signify
let g:signify_vcs_list = ['git']

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
