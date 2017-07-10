set gfn=Menlo\ Regular:h14
filetype plugin indent on     " not so sure what this does
let python_highlight_all=1
syntax on                     " enables syntax processing
syntax enable                 " I think this is a duplicate?

set clipboard=unnamed         " This sets the system clipboard to the deafault

set background=dark           " gives us the wonderful "dark" 
                              " solarized colorscheme

set showcmd                   " shows the last command entered in the very
                              " bottom right of Vim

set cursorline                " highlight current line"
filetype indent on            " filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" jk is escape
inoremap jk <esc>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=4                 " makes tabs 4 spaces
set expandtab
set shiftwidth=4
" set softtabstop=4
set backspace=indent,eol,start
set number                              " gives us line numbers
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd FileType javascript set sw=2    " sets javascript tabs to 2 spaces
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType json set sw=2
autocmd FileType json set ts=2
autocmd FileType json set sts=2

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set encoding=utf-8

let g:vim_markdown_folding_disabled=1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'davidhalter/jedi-vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsxjavascript'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme solarized           " sets the colorscheme to solarized

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
