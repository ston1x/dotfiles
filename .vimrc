if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  " let g:ruby_path = '/usr/bin/ruby'
  let g:ruby_path = $HOME . '/.rvm/rubies/ruby-2.5.1/bin/ruby'
endif

" GENERAL VIM SETTINGS
set number
set noswapfile
set undofile
set relativenumber

" Colemak to QWERTY for hjkl
" noremap n j
" noremap e k
" noremap i l

" Clipboard
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

set mouse=a
" set laststatus=2
set laststatus=0
set ruler rulerformat=%40(%=%<%F%m\ \
                      \›\ %{getfsize(@%)}B\ \
                      \›\ %l/%L:%v%)
set updatetime=100

" Set leader key
let mapleader = "\<Space>"

" Highlight search results
set incsearch
set hlsearch
" set nowrapscan

" Ignore case when searching
set ignorecase
set smartcase

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab

set encoding=UTF-8
syntax on

set nocompatible      " We're running Vim, not Vi!
set backspace=2

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd FileType ruby compiler ruby

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'foosoft/vim-argwrap'
Plug 'godlygeek/tabular'
Plug 'rrethy/vim-illuminate'
Plug 'ap/vim-css-color'
Plug 'mkitt/tabline.vim'
Plug 'w0rp/ale'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tmm1/ripper-tags'

Plug 'ervandew/supertab'
  let g:loaded_ruby_provider = 1
  let g:SuperTabDefaultCompletionType = 'context'
  let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Highlight
Plug 'vim-ruby/vim-ruby'
Plug 'plasticboy/vim-markdown'
Plug 'slim-template/vim-slim'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'squarefrog/tomorrow-night.vim'
Plug 'nightsense/seabird'
Plug 'sonph/onehalf'
Plug 'KeitaNakamura/neodark.vim'

 " Comfortable typing
 Plug 'junegunn/goyo.vim'
 Plug 'reedes/vim-pencil'
 " Plug 'vim-latex/vim-latex'
nnoremap <leader>, :Goyo<CR>
nnoremap <leader>u :UndotreeToggle<CR>

  augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md :SoftPencil
    autocmd FileType text            :SoftPencil
  augroup END

" javascript
" Plug 'mxw/vim-jsx'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'pangloss/vim-javascript'


" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 1
call plug#end()

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

let g:ackprg = 'ag --nogroup --nocolor --column'

"using rg for find in project
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{coffee,haml,hamlc,js,json,rs,go,rb,py,swift,scss}"
  \ -g "!{.git,node_modules,vendor,log,swp,tmp,venv,__pychache__}/*" '
command! -bang -nargs=* F
                 \ call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
                 \ fzf#vim#with_preview({'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'}, 'right:50%', '?'),
                 \ <bang>0)
nnoremap <leader>f :Rg<CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all --delimiter : --nth 4..'}, 'right:50%', '?'),
      \ <bang>0)
vnoremap <leader>rg y:Rg <C-R>"<CR>

"Mappings

nnoremap ,f :tabnew %<CR>
nnoremap ,v :vsplit %<CR>

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>x :q!<CR>
nnoremap <Leader>w :w<CR>
" nnoremap <leader>o :only<CR>

" git
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>l :Gblame<CR>
nnoremap <leader>co :Commits<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

nnoremap <silent> <leader>a :ArgWrap<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>e :edit!<CR>
nnoremap <leader>od :!open '%:p:h'<CR>
nnoremap <F4> :tabedit ~/.vimrc<CR>
nnoremap <F5> :so $MYVIMRC<CR>
nnoremap <F6> :PlugInstall<CR>

nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Switch between tabs
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>
nnoremap <Leader><Left> gT<CR>
nnoremap <Leader><Right> gt<CR>

" Resizing splits
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Hide those annoying search highlihghts
nnoremap cc :let @/ = ""<cr>

" binding.pry
function! InsertBindingPry()
  execute ':normal! o' . "binding.pry"
endfunction

nnoremap ,bp :call InsertBindingPry() <CR>

" NERDTree
function! MyNerdToggle()
  if &filetype == 'nerdtree' || &filetype == ''
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction
nnoremap \ :call MyNerdToggle()<CR>
let NERDTreeShowHidden=1

" Run ruby files
" autocmd FileType ruby nmap <leader>r :!ruby %<cr>

" Linting with ale
let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_pattern_options = {'.*\.gem.*\.rb$|.*\.rubies.*\.rb$': {'ale_enabled': 1}}
let g:ale_set_highlights = 0

" Remove trailing spaces on save
  autocmd BufWritePre * :%s/\s\+$//e

" fzf
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

nnoremap <C-p> :FZF -m<CR>

" Fold
set foldenable
set foldlevelstart=99
set foldmethod=indent " foldmethod=syntax is slow
nnoremap <leader>z zMzv

" Markdown
function! MarkdownConcealToggle()
  if(&conceallevel == 2)
    set conceallevel=0
  else
    set conceallevel=2
  endif
endfunction
nnoremap <leader>mc :call MarkdownConcealToggle()<CR>

"Tags
noremap <leader>rt :silent !ripper-tags -R --exclude=log
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
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<lib\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<lib\>') != -1
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

" Theming
function! ColorToggle()
  if(&background == "dark")
    set background=light
  else
    set background=dark
  endif
endfunction
map <Leader>c :call ColorToggle()<CR>

" Set theme
let g:solarized_bold=1
set cursorline
" set termguicolors
set bg=light
" let g:neodark#background = '#202020'
" let g:neodark#terminal_transparent = 1
colo solarized
" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_bold=1

syntax enable

"Commands
command! Symbolicate   :%s/"\([a-z_]\+\)"/:\1/gc
command! Stringify     :%s/:\([a-z_]\+\)/"\1"/gc
command! SpecFormatFix :%s/:\([a-z_]\+\)=>/\1: /gc
command! NewHash       :%s/"\([^=,'"]*\)"\s\+=> /\1: /gc
command! OldHash       :%s/\(\w*\): \(\w*\)/"\1" => \2/gc

command! Scratch :tabedit ~/tmp/note.md
command! Notes   :tabedit ~/tmp/notes.md


" Tabular
vmap ,:  :Tabularize /:\zs/l0l1<CR>
vmap ,": :Tabularize /":\zs/l0l1<CR>
vmap ,=  :Tabularize /=<CR>
vmap ,=> :Tabularize /=/l1l1<CR>




" Runinng tests
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* ST split | terminal <args>

nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>s. :call OpenTestAlternateSplit()<cr>

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":ST time bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map ,m :call RunTestFile()<cr>
" Run only the example under the cursor
map ,. :call RunNearestTest()<cr>
" Run all test files
map ,a :call RunTests('spec')<cr>
