call plug#begin('~/.vim/plugged')
if has('clientserver')
  Plug 'idbrii/AsyncCommand'
endif
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'flazz/vim-colorschemes'
Plug 'marijnh/tern_for_vim'
Plug 'GutenYe/json5.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'
if has("unix") && !has("win32unix")
  Plug 'nixprime/cpsm', { 'do': './install.sh' }
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif
call plug#end()

filetype plugin indent on
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
syntax on


if &term=~'xterm' || &term=~'screen'
  "set t_Co=256
  "let base16colorspace=256  " Access colors present in 256 colorspace
  set background=dark
  colorscheme base16-default
endif

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
nnoremap <F8> :!%:p<CR>
"nnoremap <silent> <C-h> :wincmd h<CR>
"nnoremap <silent> <C-j> :wincmd j<CR>
"nnoremap <silent> <C-k> :wincmd k<CR>
"nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader>,i :PluginInstall<CR>
nnoremap <silent> <leader>,u :PluginInstall!<CR>
nnoremap <silent> <leader>,c :PluginClean<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>

if has("unix") && !has("win32unix")
  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
endif

let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
