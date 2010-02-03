""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 인클루드의 Vim 설정 파일
" 마지막 수정: 2006-01-17 04:29:44 KST
" $Id: .vimrc 112 2006-01-16 19:30:18Z barosl $
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"이후 수정 - YuriHan
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 프로그램 기본 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함.
set nocp

" 모든 옵션을 원래대로 복원
set all&

" 명령어 기록을 남길 갯수 지정
set hi=100

" 백스페이스 사용
set bs=indent,eol,start

" 인코딩 설정
" 문서를 읽을 때 BOM 을 자동으로 제거하려면, fencs 맨 앞에 ucs-bom 를 추가하세요.
"let &tenc=&enc
"set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1


source $VIMRUNTIME/mswin.vim

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능들
if exists("$HOME")

" 홈 디렉토리를 구한다.
" 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가
" 붙어 있기 때문에, 그것들을 제거한다.
    let s:home_dir = $HOME
    let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
    if s:temp == "/" || s:temp == "\\"
        let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
    endif

" 경로 설정
if has("win32")
    let s:dir_tmp = s:home_dir."/_vim/tmp"
    let s:dir_backup = s:home_dir."/_vim/backup"
else
    let s:dir_tmp = s:home_dir."/.vim/tmp"
    let s:dir_backup = s:home_dir."/.vim/backup"
endif


set exrc
" 임시 디렉토리 설정
"    if isdirectory(s:dir_tmp)
"        set swf
"        let &dir = s:dir_tmp
"    else
"        set noswf
"        set dir=.
"    endif

" 백업 디렉토리 설정
"    if isdirectory(s:dir_backup)
"        set bk
"        let &bdir = s:dir_backup
"        set bex=.bak
"    else
"        set nobk
"    endif

endif

" 파일 찾기 경로 설정



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 플러그인 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist 설정
"let Tlist_Ctags_Cmd = 'C:\Progra~1\Vim\Vim71\ctags.exe'
"let Tlist_Auto_Open = 1
"let Tlist_Auto_Update = 1
"let Tlist_WinWidth = 28

" minibufexpl 설정
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
cabbr b Bs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 커서의 위치를 항상 보이게 함.
set ru

" 완성중인 명령을 표시
set sc

" 줄 번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
set ts=4
set sw=4

" 탭 -> 공백 변환 기능 (사용 안함)
set noet
set sts=0

" 자동 줄바꿈 안함
set nowrap

" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
    set cb=unnamed
endif

" magic 기능 사용
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sol
"        set gfn=???:h9:cHANGEUL
"        set gfn=GulimChe:h9:cHANGEUL
"    elseif has("unix")
"        set gfn=monospace\ 9
"    endif
"    set gfn=Jung9\ 9
"    set gfn=Fixedsys:h12:cHANGEUL
"endif

set lsp=1
filet plugin indent on

"au BufRead,BufNewFile *.dic setl ft=php
au BufRead,BufNewFile *.scala setl ft=scala
sy enable


"set noai

au FileType ,jsp setl cin

"au FileType c,cpp,html,vim,java,sh,python,xml,perl,xf86conf,conf,apache
"\ if expand("<amatch>") != "" |
"\   if exists("b:did_indent") |
"\        unlet b:did_indent |
"\   endif |
"\ runtime! indent/<amatch>.vim |
"\ endif

set go-=T
set bg=dark
"if &background == "dark"
"    hi normal guibg=black
"    set transp=6
"endif
:colorscheme rdark



com -nargs=0 Html :so $VIMRUNTIME/syntax/2html.vim


"iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
"iab xtime <C-R>=strftime("%H:%M:%S")<CR>
"nnoremap <silent> <F6> :BufExplorer<CR>
" map <c-r> :w<CR>:w<cr>:!g++ -Wall % -o %<<CR>:<CR>:!%<<CR>
":browse e
":! ruby r

"nnoremap <silent> <F6> :Explore<CR>

"map / /\v

"map <F2> :tabnew<CR>:

" <F5> ?? ??
"if has("gui_running")
"    map <F5> :!%<
"elseif has("unix")
"    map <F5> :!./%<
"endif
"map <F7> <F8>:!gcc % -o %<<CR>

"map <F8> :w<CR>

"map <F9> :TlistToggle<CR>

"map <F10> :TMiniBufExplorer<CR>

"map <F11> :ShowMarksPlaceMark<CR>

"map <F12> :ShowMarksClearMark<CR>
"

"nnoremap <silent> <F3> :NERDTreeToggle<CR> 
"nnoremap <silent> <F4> :FuzzyFinderBuffer<CR>
"nnoremap <silent> <F5> :Tlist<CR>
"nnoremap <silent> <F6> :TlistUpdate<CR> 
"nnoremap <silent> <F7> :TlistSync<CR>


"nnoremap <silent> <C-F9> :copen<CR>
nnoremap <silent> <C-R> :w!<CR>:mak<CR>:Run<CR>
"nnoremap <silent> <F10> :Run<CR>
"nnoremap <silent> <C-F10> :!insight %<.exe<CR>
"nnoremap <silent> <C-F1> :cs add D:\Utility\MinGW\include\cscope.out<CR>

" nnoremap <silent> <C-SPACE> i<C-p>


au BufRead,BufNewFile *.c,*.cpp
\ if !filereadable("Makefile") |
\ set makeprg=g++\ %\ -g\ -o\ %< |
\ endif |
\ com! -nargs=* -complete=file Run !%< <args>

au BufRead,BufNewFile *.lua
\ if !filereadable("Makefile") |
\ set makeprg=luac\ -o\ %<.lub\ %\ |
\ endif |
\ com! -nargs=* -complete=file Run !lua %<.lub

au BufRead,BufNewFile *.scala
\ if !filereadable("Makefile") |
\ set makeprg=scalac\ %<.scala |
\ endif |
\ com! -nargs=* -complete=file Run !scala %<

au BufRead,BufNewFile *.rb
\ set makeprg= |
\ com! -nargs=* -complete=file Run !ruby %<.rb

au BufRead,BufNewFile *.py
\ set makeprg= |
\ com! -nargs=* -complete=file Run !python %<.py

au BufRead,BufNewFile *.scm
\ set makeprg= |
\ com! -nargs=* -complete=file Run !mzscheme -f %<.scm

" ============================================================================= 
" stops the console window from flashing up on the screen 
" ============================================================================= 
" map <F8> :!start c:\progra~1\intern~1\iexplore.exe http://kr.engdic.yahoo.com/result.html?p=<cword><CR> 




set foldmethod=marker

set fdl=0

set fdc=0




if has("gui_running")

"    let did_install_default_menus = 1
"    let did_install_syntax_menu = 1
"    let skip_syntax_sel_menu = 1
"    set go-=m

"    set go-=T

"    set go-=l
"    set go-=L
"    set go-=r
"    set go-=R
"    set go-=b

    set mouse=a
"    set mouse=

    set mousem=popup

"    set go+=c

endif


set wmnu

let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

"augroup Binary
"    au!
"    au BufReadPre  *.bin let &bin=1
"    au BufReadPost *.bin if &bin | %!xxd
"    au BufReadPost *.bin set ft=xxd | endif
"    au BufWritePre *.bin if &bin | %!xxd -r
"    au BufWritePre *.bin endif
"    au BufWritePost *.bin if &bin | %!xxd
"    au BufWritePost *.bin set nomod | endif
"augroup END

set nospell spelllang=en

fu! ToggleNu()
    let &nu = 1 - &nu
endf
fu! ToggleList()
    let &list = 1 - &list
endf
fu! TogglePaste()
    let &paste = 1 - &paste
endf
fu! ToggleSpell()
    let &l:spell = 1 - &l:spell
endf
map \n :call ToggleNu()<CR>
map \l :call ToggleList()<CR>
map \p :call TogglePaste()<CR>
map \s :call ToggleSpell()<CR>



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

set lz

set lpl

"au BufNew * set bin | set noeol
"set bin | set noeol

" set ff=unix

set ffs=unix,dos,mac

"set csprg=C:\Progra~1\Vim\Vim72\cscope.exe
"set csto=0
"set cst
"set nocsverb
" set AcpEnable

set tags=./tags,tags
"set tags+=D:\Utility\MinGW\include\tags
"cs add D:\Utility\MinGW\include\cscope.out

if filereadable ("./cscope.out")
    cs add cscope.out
endif

set scrolloff=5

"miniBufExpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"let loaded_project = 1
"nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORTH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.f setl ft=forth
au BufRead,BufNewFile *.frm setl ft=forth
\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:dochelpdelay=100
let g:acp_behaviorSnipmateLength=1

