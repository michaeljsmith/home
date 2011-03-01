set hidden
set exrc
set incsearch
set noswapfile

set diffopt=filler,iwhite,vertical

set ts=4 sw=4

set t_Co=256

filetype indent on
set bg=dark
set guioptions=c
set guifont=Droid\ Sans\ Mono\ 10

" Set up indent object.
set runtimepath+=~/src/vim/vim-indent-object

" Set up vcscommand.
set runtimepath+=~/.home/vim/vcscommand

" Set up colour scheme.
set runtimepath+=~/.home/vim/vim-colours-dark-lord
colorscheme darklord

" Set up jest filetype.
"set runtimepath+=~/src/jest/contrib/vim

" Set up fuzzy finder.
set runtimepath+=~/src/vim/vim-l9
set runtimepath+=~/src/vim/vim-fuzzyfinder

" Set up vim-surround.
set runtimepath+=~/.home/vim/vim-surround

filetype off
filetype on

nmap  :wall<CR>

map \f :FufFile<CR>
map \b :FufBuffer<CR>
map \d :FufDir<CR>

syn on

set bg=light
