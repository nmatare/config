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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'benmills/vimux'
Plugin '907th/vim-auto-save'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'joshdick/onedark.vim'
Plugin 'szymonmaszke/vimpyter' 
Plugin 'tpope/vim-fugitive'
Plugin 'fisadev/vim-isort'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'patstockwell/vim-monokai-tasty'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call vundle#end()           
call plug#end()
filetype plugin indent on  
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"let g:vim_monokai_tasty_italic = 1
"colorscheme vim-monokai-tasty
"let g:airline_theme='monokai_tasty'
colorscheme onedark
set colorcolumn=80
set background=dark
set tabstop=4
set textwidth=79
set softtabstop=4
set autoindent
set nowrap
syntax on
set mouse=a
set clipboard=unnamedplus
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
set termguicolors
autocmd vimenter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1 
let NERDTreeShowHidden=1
set splitright
set foldlevel=99
set foldmethod=indent
let g:vim_isort_map = '<C-i>' 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
nnoremap <C-p> :Files<CR>
let g:tmux_navigator_save_on_switch = 2
map <Leader>r :VimuxPromptCommand<CR>
map <Leader>rr :VimuxRunLastCommand<CR>
map <Leader>tz :VimuxZoomRunner<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:auto_save = 1
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

