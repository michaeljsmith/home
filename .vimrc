set hidden
set exrc
set incsearch
set noswapfile
set nowrap
set history=1000
set hlsearch

noremap ' `
noremap ` '

let mapleader = ","

set wildmenu
set wildmode=list:longest

set scrolloff=4

set title

set shortmess=atI

set diffopt=filler,iwhite,vertical

set ts=4 sw=4

set t_Co=256

set laststatus=2

filetype plugin indent on
set bg=dark
set guioptions=c
set guifont=Droid\ Sans\ Mono\ 10

" Set up indent object.
set runtimepath+=~/.home/vim/vim-indent-object

" Set up colour scheme.
set runtimepath+=~/.home/vim/vim-colours-dark-lord
colorscheme darklord

" Set up jest filetype.
"set runtimepath+=~/src/jest/contrib/vim

" Set up fuzzy finder.
set runtimepath+=~/.home/vim/vim-l9
set runtimepath+=~/.home/vim/vim-fuzzyfinder

" Set up vim-surround.
set runtimepath+=~/.home/vim/vim-surround

" Set up vim-fugitive.
set runtimepath+=~/.home/vim/vim-fugitive

" Support google indentation requirements.
set expandtab
set shiftwidth=2
set softtabstop=2

filetype off
filetype on

set fo=croql tw=98

nmap  ;noh<CR>;wall<CR>

noremap ; :
noremap : ;

map <F10> ;copen<CR>
map <S-F10> ;cclose<CR>

map <Leader>f ;FufFile<CR>
map <Leader>b ;FufBuffer<CR>
map <Leader>d ;FufDir<CR>
map <Leader>t ;call system("bash -c \"(git ls-files; git ls-files --other --exclude-standard) \| xargs ctags -R\"")<CR>;FufTag<CR>

nmap { ;cp<CR>
nmap } ;cn<CR>
nmap \ ;pclose<CR>;cclose<CR>

syn on
" From slime.vim
function! Send_to_Screen(text)
  if !exists("b:slime")
    call Screen_Vars()
  end

  let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
  call system("screen -S " . b:slime["sessionname"] . " -p " . b:slime["windowname"] . " -X stuff " . escaped_text)
endfunction

function! Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function! Screen_Vars()
  if !exists("b:slime")
    let b:slime = {"sessionname": "", "windowname": "0"}
  end

  let b:slime["sessionname"] = input("session name: ", b:slime["sessionname"], "custom,Screen_Session_Names")
  let b:slime["windowname"]  = input("window name: ", b:slime["windowname"])
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-j><C-j> "ry ;call Send_to_Screen(@r)<CR>
nmap <C-j><C-j> vip<C-j><C-j>

nmap <C-j>v ;call Screen_Vars()<CR>

map <Leader>g ;call fuf#givenfile#launch('', 0, "git ls-files> ", split(system("bash -c \"(git ls-files; git ls-files --other --exclude-standard)\""), "\n"))<CR>
map * ;call fuf#givenfile#launch(expand("<cword>"), 0, "git ls-files> ", split(system("bash -c \"(git ls-files; git ls-files --other --exclude-standard)\""), "\n"))<CR>
let g:fuf_maxMenuWidth=200

map <Leader>h ;call fuf#givenfile#launch('', 0, ".files> ", split(system("ls -d ~/.home/.*"), "\n"))<CR>

map <Leader>s ;Gstatus<CR>

function! GitGrep(text)
  silent exe "Ggrep! " . a:text
  copen
  redraw!
endfunction

nmap 8 ;call GitGrep("\"\\<" . expand("<cword>") . "\\>\"")<CR>

command! -nargs=1 Ugrep ;call GitGrep(<q-args>)

map <Leader>l ;!git5 lint > glint.out<CR>;cfile glint.out<CR>;silent !rm glint.out<CR>;redraw!<CR>
