call pathogen#runtime_append_all_bundles()
"　交換性を無くす。
set nocompatible

" for history
set history=10000


" for terminal
"set term=cons25


"
set bs=indent,eol,start

" for move windows with hjkl
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

" Show (partial) command in the last line of the screen.
set showcmd

" Show line number
set number

" Set encoding
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1
set shell=zsh

" tab select
set tabstop=2
set shiftwidth=2

" not use number of space to insert a Tab
set expandtab
retab

set wrap
" for regexp like movement
set magic
" last modify location save
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

filetype plugin indent on
autocmd BufRead,BufNewFile *.scala setlocal filetype=scala
autocmd BufRead,BufNewFile *_spec.rb setlocal filetype=rspec
autocmd BufRead,BufNewFile *.jsp setlocal cindent
syntax enable

"colorscheme pyte

nmap <silent> <Leader>o :NERDTreeToggle<CR>
nmap <silent> <Leader>i :BufExplorer<CR>
nmap <silent> <Leader>] :FufTagWithCursorWord<CR>
" Edit routes
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb"
nnoremap <silent> <C-R> :w!<CR>:Run<CR><CR>

autocmd BufRead,BufNewFile *.c,*.cpp
\ if !filereadable("Makefile") |
\ set makeprg=g++\ %\ -g\ -o\ %< |
\ endif |
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "%<"

autocmd BufRead,BufNewFile *.lua
\ if !filereadable("Makefile") |
\ set makeprg=luac\ -o\ %<.lub\ %\ |
\ endif |
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "lua %<"

autocmd BufRead,BufNewFile *.scala
\ if !filereadable("Makefile") |
\ set makeprg=scalac\ %<.scala |
\ endif |
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "scala %<"

autocmd BufRead,BufNewFile *.rb
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "ruby %"

autocmd BufRead,BufNewFile *.py
\ set makeprg= |
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "python %"

autocmd BufRead,BufNewFile *.scm
\ set makeprg= |
\ command! -nargs=* -complete=file Run !screen  -p 3 -X stuff "mzschme %"

if has("gui_running")
	set mouse=a
endif

set wildmenu
function! ToggleNu()
    let &nu = 1 - &nu
endf
function! ToggleList()
    let &list = 1 - &list
endf
function! ToggleSpell()
    let &l:spell = 1 - &l:spell
endf
map \n :call ToggleNu()<CR>
map \l :call ToggleList()<CR>
map \s :call ToggleSpell()<CR>
map <silent>\c mmviw:s/\(\l\)\(\u\)/\L\1_\2\E/g<CR>`mviw:s/\(\h\)\(\h\+\)/\L\1\E\2/g<CR>
map <silent>\C mmviw:s/_\(\l\)/\U\1/g<CR>`mviw:s/\(\h\)\(\h\+\)/\U\1\E\2/g<CR>


ab fucntion function
ab calss class
ab functio function
ab dunction function
ab functuin function
ab dunction function
ab functuin function
ab functopn function
ab fumction function
ab vlass class
ab xlass class
ab classs class
ab forarch foreach
ab inser insert
ab insertt insert
ab quewrty query
ab ovject object
ab objectr object
ab evho echo
ab printr print_r
ab prit print
ab fales false
ab flase false
ab treu true
ab teur true
ab ture true
ab nulll null
ab nuii null
ab retrun return
ab retunr return
ab htis this
ab erturn return

set loadplugins

set tags=./tags

set scrolloff=8


" default grep option
let Grep_Default_Filelist = '*.rb *.erb *.js'
let Grep_Default_Options = '-i'
let Grep_Skip_Dirs = 'tmp log .svn'
let Grep_Skip_Files = '*.bak *~ *.tmp'
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git*,*.gif,*.jpg,*.png"
