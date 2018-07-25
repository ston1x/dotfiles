set number
set noswapfile
set clipboard=unnamed
set relativenumber
set mouse=a
set laststatus=0
set updatetime=100

" Highlight search results
set incsearch
set hlsearch

" Ignore case when searching
set ignorecase
set smartcase


set tabstop=2
set shiftwidth=2
set expandtab

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
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'altercation/vim-colors-solarized'
Plug 'KKPMW/sacredforest-vim'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'
call plug#end()

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme solarized
"set termguicolors
set background=light
let g:solarized_bold=1
syntax enable

" Using rg for find in project
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

nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Hide those annoying search highlihghts
nnoremap cc :let @/ = ""<cr>

nnoremap \ :NERDTreeToggle<CR>
nnoremap ,r :NERDTreeFind<CR>
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

nnoremap <C-p> :FZF -m<CR>

noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>

"Tags
set shell=zsh
set tags+=.git/tags,.git/rubytags,.git/bundlertags
set tagcase=match
noremap ,gt :!gentags<CR>

