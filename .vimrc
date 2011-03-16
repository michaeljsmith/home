set hidden
set exrc
set incsearch
set noswapfile

set diffopt=filler,iwhite,vertical

set ts=4 sw=4

set t_Co=256

set laststatus=2

filetype indent on
set bg=dark
set guioptions=c
set guifont=Droid\ Sans\ Mono\ 10

" Set up indent object.
set runtimepath+=~/.home/vim/vim-indent-object

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

" Set up vim-fugitive.
set runtimepath+=~/.home/vim/vim-fugitive

" Set up command-t
set runtimepath+=~/.home/vim/command-t
filetype off
filetype on

nmap  :wall<CR>

map \f :FufFile<CR>
map \b :FufBuffer<CR>
map \d :FufDir<CR>

nmap { :cp<CR>
nmap } :cn<CR>
nmap \ :cclose<CR>

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

vmap <C-j><C-j> "ry :call Send_to_Screen(@r)<CR>
nmap <C-j><C-j> vip<C-j><C-j>

nmap <C-j>v :call Screen_Vars()<CR>

map <Leader>g :call fuf#givenfile#launch('', 0, "git ls-files> ", split(system("bash -c \"(git ls-files; git ls-files --other --exclude-standard)\""), "\n"))<CR>
map * :call fuf#givenfile#launch(expand("<cword>"), 0, "git ls-files> ", split(system("bash -c \"(git ls-files; git ls-files --other --exclude-standard)\""), "\n"))<CR>
let g:fuf_maxMenuWidth=200

function! GitGrep(text)
  silent exe "Ggrep! " . a:text
  copen
  redraw!
endfunction

nmap 8 :call GitGrep("\"\\<" . expand("<cword>") . "\\>\"")<CR>

command! -nargs=1 Ugrep :call GitGrep(<q-args>)
