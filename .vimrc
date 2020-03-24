" vundle pluginmanager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'hwayne/tla.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rhysd/vim-clang-format'
Plugin 'moznion/jcommenter.vim'
Plugin 'eclim', {'pinned': 1}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :sadfsdPluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

syntax on
colorscheme monokai
set splitright
set number relativenumber
set cursorline
set showcmd
set showmatch
set incsearch
set wildmenu
set encoding=utf-8
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
inoremap jk <esc>

let python_highliht_all=1

let mapleader=","

" relaod vimrc
nnoremap <leader>s :source $MYVIMRC<cr>

nmap <silent> <leader>m :NERDTreeToggle<cr>
nmap <silent> <leader>n :TagbarToggle<cr>

" buffers
set hidden
let g:airline#extensions#tabline#enabled = 1
nmap Ö :enew <cr>
nmap ö :bprev <cr>
nmap ä :bnext <cr>
nmap Ä :bd <cr>


" move to beginning/end of line
nnoremap B ^
nnoremap E $

" backup at tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"enable folding
set foldmethod=indent
set foldlevelstart=15
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers = []
