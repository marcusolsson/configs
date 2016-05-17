call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'robertmeta/nofrils'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', { 'do': 'make'}
else 
	Plug 'Valloric/YouCompleteMe'
endif

" filetype plugins
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}

call plug#end()

" These are default on NeoVim.
if !has('nvim')
	set nocompatible
	filetype off
	filetype plugin indent on

	set ttyfast
	set ttymouse=xterm2
	set ttyscroll=3

	set encoding=utf-8              " Set default encoding to UTF-8
	set autoread                    " Automatically reread changed files without asking me anything
	set autoindent                  
	set backspace=indent,eol,start  " Makes backspace key more powerful.
	set incsearch                   " Shows the match while typing
endif

" COLORS
" ------------------------------------------------------------------------------

if has('!nvim')
	syntax enable
	set t_Co=256
endif
set background=dark
colorscheme nofrils-dark

" SETTINGS
" ------------------------------------------------------------------------------

set noswapfile	   " Disable swap files.
set nobackup       " Don't create backups.
set nocursorcolumn " do not highlight column
set nocursorline   " do not highlight line
set nowrap    	   " Do not wrap long lines.

set re=1           " use old regex engine, faster for Go highlighting
set number         " Display line numbers
set hidden    	   " Hide buffers
set lazyredraw     " Disable excessive redrawing.
set scrolloff=5    " Keep lines above and below the cursor when scrolling.
set sidescroll=1
set autowrite 	   " Save on buffer switch.
set fillchars=""   " Remove the vertical split separator.
set breakindent    " keep wrapped lines indented
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows

set history=1000
set linespace=0

set ignorecase     " Ignore case when searching.
set smartcase      " Only ignore case when search string is lowercase.
set nohlsearch     " Don't highlight matches

set completeopt-=preview " Disable preview window on autocomplete

set tabstop=4
set shiftwidth=4
set softtabstop=4

set laststatus=1
set wildmenu       " Visual auto-complete for command menu
set mouse=a        " Enable mouse support
set pumheight=10             " Completion window max size

" These remove Esc delay
set ttimeout
set ttimeoutlen=50

" MAPPINGS
" ------------------------------------------------------------------------------

let mapleader=","

" Visual linewise up and down by default
noremap j gj
noremap k gk

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Center on search
nnoremap n nzzzv
nnoremap N Nzzzv

let loaded_matchparen = 1 
let g:netrw_banner=0 

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" System clipboard
nnoremap <Leader>p "+]p
nnoremap <Leader>P "+]P
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

map <leader>e :Explore<cr> 
map <leader>n :NERDTreeToggle<cr>

" Learn Vim!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" COMPLETION
" ------------------------------------------------------------------------------

if has('nvim') 
	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
	let g:deoplete#enable_at_startup = 1
else 
	let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	
	" make YCM compatible with UltiSnips (using supertab)
	let g:SuperTabDefaultCompletionType = '<C-n>'
endif

" PLUGINS
" ------------------------------------------------------------------------------

" Markdown
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown setlocal spell 

" Go programming
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap gD <Plug>(go-doc)
au FileType go nmap gr <Plug>(go-rename)

let g:go_fmt_command="goimports"
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck', 'gocyclo']
let g:go_metalinter_autosave=1

" Toggle between test and implementation
nmap T :GoAlternate<CR>

let g:go_auto_type_info=0
let g:godef_same_file_in_same_window=1
let g:godef_split=0

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_space_tab_error=1
let g:go_trailing_whitespace_error=1
let g:go_chan_whitespace_error=1
let g:go_array_whitespace_error=1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]Godeps\/_workspace'

nmap <C-b> :CtrlPBuffer<CR>

" Python
autocmd BufWritePost *.py call Flake8()

" Javascript
autocmd FileType javascript setlocal sw=2

" Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
