" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

syntax enable
set background=dark
colorscheme solarized
set tabstop=2 shiftwidth=2 expandtab
set number

set colorcolumn=121

set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
hi IndentGuidesEven  ctermfg=242 ctermbg=0 guifg=grey15 guibg=grey30

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'tomtom/tcomment_vim'

Plug 'Valloric/YouCompleteMe'

Plug 'tpope/vim-surround'

call plug#end()

set laststatus=2
set noshowmode

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'flazz/vim-colorschemes'

Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

