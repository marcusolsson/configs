set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdtree'

" Color scheme
Plugin 'w0ng/vim-hybrid'
Plugin 'base16-vim'

" Programming
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'fatih/vim-go'
Plugin 'benmills/vim-golang-alternate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on

"let mapleader="\<Space>"
map <Space> <leader>

nmap <leader>sh :leftabove  vnew<cr>
nmap <leader>sl :rightbelow vnew<cr>
nmap <leader>sk :leftabove  new<cr>
nmap <leader>sj :rightbelow new<cr>

nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>p "+p
nmap <leader>P "+P
nmap <leader>Y "+Y
vmap <leader>y "+y


syntax enable
colorscheme hybrid
let g:hybrid_use_Xresources = 1

" GUI stuff
set guioptions=
set guifont=Inconsolata\ 12

set background=dark " Dark background
set number " Display line numbers
set noswapfile
set noshowmode " Handled by lightline
set hidden " Hide buffers

" Remaps for convenience
nnoremap n nzz
nnoremap j gj
nnoremap k gk

map <C-s> :w<kEnter>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Learn Vim!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Go programming
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)

let g:go_fmt_command="goimports"

" Toggle between test and implementation
nmap T :A<CR>

" Disable preview window on autocomplete
set completeopt-=preview

" Recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

