set nu
set noswapfile
set clipboard=unnamed
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set laststatus=2
syntax on

let mapleader = "\<Space>"

set nocompatible      " We're running Vim, not Vi!
set backspace=2

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd FileType ruby compiler ruby

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yggdroot/indentline'
Plug 'chrisbra/colorizer'
call plug#end()

"using rg for find in project
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{coffee,haml,hamlc,js,json,rs,go,rb,py,swift,scss}"
  \ -g "!{.git,node_modules,vendor,log,swp,tmp,venv,__pychache__}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"Mappings
nnoremap <leader>f :F<CR>
nnoremap ,f :tabnew %<CR>

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>h :hide<CR>
nnoremap <leader>o :only<CR>

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

"Tags
set shell=zsh
set tags+=.git/tags,.git/rubytags,.git/bundlertags
set tagcase=match
noremap ,gt :!gentags<CR>

