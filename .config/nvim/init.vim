""                        _
""  _ __   ___  _____   _(_)_ __ ___  _ __ ___
"" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \| '__/ __|
"" | | | |  __/ (_) \ V /| | | | | | | | | (__
"" |_| |_|\___|\___/ \_/ |_|_| |_| |_|_|  \___|

"" Setting up plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/bin/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'codota/tabnine-vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'valloric/youcompleteme'
Plugin 'honza/vim-snippets'
Plugin 'xuhdev/vim-latex-live-preview'
call vundle#end()

"" Setting up basic configurations
set nocompatible
set number
set hlsearch
set autoindent
set tabstop=8
set shiftwidth=8
set expandtab
set encoding=utf-8
filetype off
filetype plugin indent on
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
nnoremap <C-F> :Files<CR>
