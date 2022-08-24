"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a 				" Enable mouse
set tabstop=4
set shiftwidth=4
set listchars=tab:\¦\ 		" Tab charactor
set list
set foldmethod=indent
set foldlevelstart=99
set number 					" Show line number
set relativenumber
set ignorecase 				" Enable case-sensitive
set smartindent
set autoindent
set incsearch
set nohlsearch
set termguicolors
set splitbelow
set splitright
set expandtab
set nocompatible
set fileformat=unix
filetype indent on
set cursorline
set encoding=utf-8

set autoread
set autowrite

" Disable backup
set nobackup
set nowb
set noswapfile

if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
		\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
			\ | checktime 
		\ | endif
autocmd FileChangedShellPost *
		\ echohl WarningMsg 
		\ | echo "File changed on disk. Buffer reloaded."
		\ | echohl None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Press jj to return to normal mode when in insert mode
" inoremap jj <ESC>
" inoremap <ESC> <NOP>
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
nmap nt :bnext<Return>
nmap pt :bprevious<Return>
nmap ct :bd<Return>
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged')
" Theme
	Plug 'joshdick/onedark.vim', 					" Dark theme
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'p00f/nvim-ts-rainbow'

" Code Formatter
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Code Intelligense
	Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
	Plug 'alvan/vim-closetag' 					    " Auto close HTML/XML tag
	Plug 'preservim/nerdcommenter' 					" Comment code
	Plug 'sheerun/vim-polyglot'

" Code Autocomplete
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

" Vim snip
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

" Vim Icon
	Plug 'onsails/lspkind-nvim'
" File browser
	Plug 'preservim/nerdTree' 					    " File browser  
	Plug 'Xuyuanp/nerdtree-git-plugin' 				" Git status
	Plug 'ryanoasis/vim-devicons' 					" Icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'unkiwii/vim-nerdtree-sync' 				" Sync current file 

" File search
	Plug 'junegunn/fzf', 
		\ { 'do': { -> fzf#install() } } 			" Fuzzy finder 
	Plug 'junegunn/fzf.vim'

" Terminal
	Plug 'voldikss/vim-floaterm' 					" Float terminal

" Status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

" Code syntax highlight
	Plug 'yuezk/vim-js' 						    " Javascript
	Plug 'jackguo380/vim-lsp-cxx-highlight'			" C++ syntax

" Source code version control 
	Plug 'tpope/vim-fugitive' 					    " Git
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
syntax on
let g:onedark_config = {
    \ 'style': 'dark',
\}
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=0
let g:onedark_termcolors=256
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

colorscheme onedark

" Status bar
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" hi Visual guibg=#33467c
hi Visual guibg=#263d55
" hi CursorLineNr guifg=#ffdc3f
hi Comment guifg=#728083
hi LineNr guifg=#728083
hi CursorLine guibg=#292e42

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Extended Settings
" Lua Files
luafile ~\AppData\Local\nvim\lua\plug-colorizer.lua
luafile ~\AppData\Local\nvim\lua\treesitter.lua
luafile ~\AppData\Local\nvim\lua\cmp-config.lua
luafile ~\AppData\Local\nvim\lua\nvim-lspconfig.lua
luafile ~\AppData\Local\nvim\lua\diagnostic_signs.lua
luafile ~\AppData\Local\nvim\lua\language_servers.lua

" Vim Files
source  ~\AppData\Local\nvim\settings\floaterm.vim
source  ~\AppData\Local\nvim\settings\fzf.vim
source  ~\AppData\Local\nvim\settings\nerdtree.vim
source  ~\AppData\Local\nvim\settings\nerdcommenter.vim
source  ~\AppData\Local\nvim\settings\vim-prettier.vim
source  ~\AppData\Local\nvim\settings\vim-snip.vim
