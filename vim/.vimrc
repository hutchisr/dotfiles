if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
if has('clientserver')
  Plug 'idbrii/AsyncCommand'
endif
"Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
"Plug 'kien/ctrlp.vim'
"Plug 'maralla/validator.vim'
Plug 'w0rp/ale'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/nvim-typescript'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'cespare/vim-toml'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'mhartington/nvim-typescript'
endif
call plug#end()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
let g:airline_theme="one"
set background=dark
colorscheme one

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

set noshowmode

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd bufenter *.jade setlocal filetype=jade
autocmd bufenter *.hjson setlocal filetype=yaml

let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = -30
let g:netrw_banner = 0

" Mappings
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>n :Lexplore<CR>
nnoremap <silent> <leader>l :lcd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>q :Bdelete<CR>
nnoremap , @q
nnoremap <silent> <leader>,i :PlugInstall<CR>
nnoremap <silent> <leader>,u :PlugInstall!<CR>
nnoremap <silent> <leader>,c :PlugClean<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <C-p> :Files<CR>
nnoremap <A-p> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :Tags<CR>
nnoremap <C-o> :BTags<CR>
nnoremap <C-n> :Lexplore<CR>

"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

if has('nvim')
  " deoplete tab-complete
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_at_startup = 1
endif
aug vimrc
  au!
  au BufWritePost .vimrc source %
  au BufWritePost init.vim source %
aug END

aug filetypes
  au!
  au BufRead,BufNewFile,BufReadPost pyproject.lock set filetype=toml
aug END
