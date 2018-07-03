:set nu

:set tabstop=2
:set shiftwidth=2
:set expandtab

:set laststatus=2
:syntax on

:set nocompatible      " We're running Vim, not Vi!
:filetype on           " Enable filetype detection
:filetype indent on    " Enable filetype-specific indenting
:filetype plugin on    " Enable filetype-specific plugins

autocmd FileType ruby compiler ruby

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

nnoremap \ :NERDTreeToggle<CR>
nnoremap ,r :NERDTreeFind<CR>

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

nnoremap <C-p> :FZF -m<CR>

noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>
