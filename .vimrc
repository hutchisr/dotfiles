autocmd!
set number

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent
set backspace=indent,eol,start
set hidden

set ignorecase
set smartcase
set incsearch
set nohlsearch

let mapleader="\\"
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
"Plugin 'dyng/ctrlsf.vim'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'digitaltoad/vim-jade'
Plugin 'moll/vim-node'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'GutenYe/json5.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'plasticboy/vim-markdown'
Plugin 'edkolev/tmuxline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'othree/yajs.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'vim-scripts/SyntaxComplete'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'vim-scripts/dbext.vim'

call vundle#end()

syntax on

filetype plugin indent on

set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-default

let loaded_matchparen = 1

"AirlineTheme base16

set noshowmode

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd bufenter *.jade setlocal filetype=jade
autocmd bufenter *.hjson setlocal filetype=yaml

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

augroup nerd_tree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Mappings

nnoremap <C-c> <leader>c<space>
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>l :lcd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>q :Bdelete<CR>
nnoremap , @q
nnoremap <F5> :!%:p<CR>
"nnoremap <silent> <C-h> :wincmd h<CR>
"nnoremap <silent> <C-j> :wincmd j<CR>
"nnoremap <silent> <C-k> :wincmd k<CR>
"nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader>,i :PluginInstall<CR>
nnoremap <silent> <leader>,u :PluginInstall!<CR>
nnoremap <silent> <leader>,c :PluginClean<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>pse :!psql $DB_URL -e -f %<CR>

":vmap pg :w !psql $DB_URL -e

" ctrlp custom ignore
let g:ctrlp_custuum_ignore = {
  \ 'dir': '\v[\/]node_modules$/'
\ }
let g:ctrlp_user_command = 'ack -f 
      \ --ignore-dir=.git
      \ --ignore-dir=node_modules --ignore-dir=bower_components
      \ %s'
"let g:ctrlp_user_command = 'ag --nogroup --nocolor --column
      "\ --ignore .git --ignore node_modules --ignore bower_components
      "\-g "" %s'
"let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
" tmuxline setup
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
