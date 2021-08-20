""                        _
""  _ __   ___  _____   _(_)_ __ ___  _ __ ___
"" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \| '__/ __|
"" | | | |  __/ (_) \ V /| | | | | | | | | (__
"" |_| |_|\___|\___/ \_/ |_|_| |_| |_|_|  \___|

"" Set up plugin manager Vundle
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
Plugin 'xuhdev/vim-latex-live-preview'
call vundle#end()

"" Set up basic configurations
set nocompatible
set expandtab
set number
set hlsearch
set autoindent
set shiftwidth=4
set encoding=utf-8
filetype off
filetype plugin indent on
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
:nnoremap <C-F> :Files<CR>
