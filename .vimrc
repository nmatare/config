" Short Description: .vimrc configuration file 
" Maintainer: Nathan Matare
" Contact: nathan.matare@gmail.com

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call plug#begin('~/.vim/plugged')

Bundle 'Valloric/YouCompleteMe'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim' 
Plugin 'vim-airline/vim-airline'
Plugin 'benmills/vimux'
Plugin 'chrisbra/vim-autosave'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'joshdick/onedark.vim'
Plugin 'szymonmaszke/vimpyter' 
Plugin 'tpope/vim-fugitive'
Plugin 'fisadev/vim-isort'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'patstockwell/vim-monokai-tasty'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call vundle#end()           
call plug#end()
filetype plugin indent on  
let g:pymode_python = 'python3'
let g:vim_isort_python_version = 'python3'
let g:pymode_rope_lookup_project = 0

" Key Bindings and Mappings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set autoindent
set nowrap
set textwidth=79
autocmd filetype python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd filetype r setlocal expandtab shiftwidth=2 softtabstop=2
autocmd filetype sh setlocal expandtab shiftwidth=2 softtabstop=2

let g:loaded_autosave = 1
let g:autosave_timer = 60*1000*1 " 1min
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Themes and Colors
" https://github.com/morhetz/gruvbox
"colorscheme vim-monokai-tasty
"let g:vim_monokai_tasty_italic = 1
"let g:airline_theme='monokai_tasty'
colorscheme onedark
let g:onedark_terminal_italics = 1
set term=xterm-256color
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
set colorcolumn=80
set background=light
set tabstop=4
set textwidth=79
set softtabstop=4
set autoindent
set nowrap
let python_highlight_all=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'

" Access and Misc
syntax on
set mouse=a
set bs=2
set encoding=utf8
set number
set swapfile
set dir=/tmp
set expandtab
set autoread
set showmatch
set modifiable 
set showcmd
set nohidden
set hidden
set ignorecase
set smartcase
set incsearch
set cursorline
set hlsearch

" Tree Search
autocmd vimenter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1 
let NERDTreeShowHidden=1
set splitright
set foldlevel=99
set foldmethod=indent
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Tmux extensions
nnoremap <C-p> :Files<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
let g:tmux_navigator_save_on_switch = 2
map <Leader>r :VimuxPromptCommand<CR>
map <Leader>rr :VimuxRunLastCommand<CR>
map <Leader>tz :VimuxZoomRunner<CR>

" Jupyter Notebook
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

