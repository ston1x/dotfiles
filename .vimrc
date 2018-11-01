set number
set noswapfile
set clipboard=unnamed
" set relativenumber
set mouse=a
set laststatus=0
set updatetime=100
set wildmenu

" Highlight search results
set incsearch
set hlsearch

" Ignore case when searching
set ignorecase
set smartcase


set tabstop=2
set shiftwidth=2
set expandtab

set encoding=UTF-8

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
Plug 'vim-ruby/vim-ruby'
Plug 'altercation/vim-colors-solarized'
Plug 'KKPMW/sacredforest-vim'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'foosoft/vim-argwrap'
Plug 'godlygeek/tabular'
Plug 'rrethy/vim-illuminate'
Plug 'ap/vim-css-color'
call plug#end()

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme solarized
"set termguicolors
set background=light
let g:solarized_bold=1
syntax enable

let g:ackprg = 'ag --nogroup --nocolor --column'

"using rg for find in project
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{coffee,haml,hamlc,js,json,rs,go,rb,py,swift,scss}"
  \ -g "!{.git,node_modules,vendor,log,swp,tmp,venv,__pychache__}/*" '
command! -bang -nargs=* F
                 \ call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
                 \ fzf#vim#with_preview(),
                 \ <bang>0)
nnoremap <leader>f :F<CR>
"Mappings
nnoremap <leader>f :F<CR>
nnoremap ,f :tabnew %<CR>

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>h :hide<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>b :Gblame<CR>
nnoremap <C-e> :Buffers<CR>
nnoremap <silent> <leader>a :ArgWrap<CR>
nnoremap <leader>m :BTags<CR>
nnoremap <leader>e :edit!<CR>

nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Hide those annoying search highlihghts
nnoremap cc :let @/ = ""<cr>

nnoremap \ :NERDTreeToggle<CR>
nnoremap ,r :NERDTreeFind<CR>
let NERDTreeShowHidden=1

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop -R<CR>

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

nnoremap <C-p> :FZF -m<CR>

noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Fold
set foldenable
set foldlevelstart=99
set foldmethod=indent " foldmethod=syntax is slow
nnoremap <leader>z zMzv

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>

"Tags
set shell=zsh
set tags+=.git/tags,.git/rubytags,.git/bundlertags
set tagcase=match
noremap ,gt :!gentags<CR>

" Convert slashes to backslashes for Windows.
if has('win32')
  nmap <Leader>cs :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <Leader>cl :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap <Leader>c8 :let @+=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap <Leader>cs :let @+=expand("%")<CR>
  nmap <Leader>cl :let @+=expand("%:p")<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! OpenTestAlternateSplit()
  let new_file = AlternateForCurrentFile()
  exec ':vsp ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif

  return new_file
endfunction

nnoremap <leader>s :call OpenTestAlternate()<cr>
nnoremap <leader>s. :call OpenTestAlternateSplit()<cr>

function! ColorToggle()
  if(&background == "dark")
    set background=light
  else
    set background=dark
  endif
endfunction

map <Leader>c :call ColorToggle()<CR>

"Commands
command! Symbolicate   :%s/"\([a-z_]\+\)"/:\1/gc
command! Stringify     :%s/:\([a-z_]\+\)/"\1"/gc
command! SpecFormatFix :%s/:\([a-z_]\+\)=>/\1: /gc
command! NewHash       :%s/"\([^=,'"]*\)"\s\+=> /\1: /gc
command! OldHash       :%s/\(\w*\): \(\w*\)/"\1" => \2/gc


" Tabular
vmap ,:  :Tabularize /:\zs/l0l1<CR>
vmap ,": :Tabularize /":\zs/l0l1<CR>
vmap ,=  :Tabularize /=<CR>
vmap ,=> :Tabularize /=/l1l1<CR>

