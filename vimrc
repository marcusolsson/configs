set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'

" Color scheme
Plugin 'w0ng/vim-hybrid'
Plugin 'base16-vim'

" Programming
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'fatih/vim-go'
Plugin 'benmills/vim-golang-alternate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on

" Colors
syntax enable
colorscheme hybrid
let g:hybrid_use_Xresources = 1
let g:airline_powerline_fonts = 1

" GUI stuff
set guioptions-=T
set guifont=Sauce\ Code\ Powerline\ 10

" For creating an airline terminal prompt
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

set background=dark " Dark background
set number " Display line numbers
set hlsearch " Highlight search results
set incsearch " Enable incremental search
set noswapfile
set laststatus=2 " Always display status line

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

