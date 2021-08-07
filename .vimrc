""        _
"" __   _(_)_ __ ___  _ __ ___
"" \ \ / / | '_ ` _ \| '__/ __|
""  \ V /| | | | | | | | | (__
""   \_/ |_|_| |_| |_|_|  \___|

set nocompatible
set expandtab
set number
set hlsearch
set autoindent
set shiftwidth=4
set encoding=utf-8
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'codota/tabnine-vim'
call vundle#end()
filetype plugin indent on
