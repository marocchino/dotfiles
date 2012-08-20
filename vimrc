source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

"　交換性を無くす。
set nocompatible

" for history
set history=10000

set statusline=%#ErrorMsg#%{PomodoroStatus()}%#StatusLine#[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P

" To display the status line always
set laststatus=2

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

set ttimeoutlen=50  " Make Esc work faster

" for putty
"set term=cons25

set incsearch hlsearch
"
set bs=indent,eol,start

" for move windows with hjkl
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <esc><esc> :nohlsearch<CR>


" allow buffer change in unsaved file
set hidden

" Show line number
set number

" Set encoding
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,euc-kr,big5,ucs-2le,latin1
set shell=zsh

" tab select
set tabstop=2 sts=2 shiftwidth=2 expandtab

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :retab
autocmd InsertEnter * hi StatusLine guibg=#a0a080 ctermfg=Yellow
autocmd InsertLeave * hi StatusLine guibg=#8090a0 ctermfg=White

set wrap
" for regexp like movement
set magic

if has("autocmd")
  " vimrc on fly
  autocmd bufwritepost .vimrc source $MYVIMRC

  " last modify location save
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "norm g`\"" |
  \ endif

  autocmd BufRead,BufNewFile *.c,*.cpp
  \ if !filereadable("Makefile") |
  \ set makeprg=g++\ %\ -g\ -o\ %< |
  \ endif |
  \ command! -nargs=* -complete=file Run !%<

  autocmd BufRead,BufNewFile *.lua
  \ if !filereadable("Makefile") |
  \ set makeprg=luac\ -o\ %<.lub\ %\ |
  \ endif |
  \ command! -nargs=* -complete=file Run !lua %<

  autocmd BufRead,BufNewFile *.scala
  \ if !filereadable("Makefile") |
  \ set makeprg=scalac\ %<.scala |
  \ endif |
  \ command! -nargs=* -complete=file Run !scala %<

  autocmd BufRead,BufNewFile *.coffee
  \ command! -nargs=* -complete=file Run !coffee %

  autocmd BufRead,BufNewFile *.rb
  \ command! -nargs=* -complete=file Run !ruby %

  autocmd BufRead,BufNewFile *.py
  \ set makeprg= |
  \ command! -nargs=* -complete=file Run !python %

  autocmd BufRead,BufNewFile *.scm
  \ set makeprg= |
  \ command! -nargs=* -complete=file Run !mzschme %
  if has("gui_macvim")
    nnoremap <silent> <D-r> :w!<CR>:Run<CR>
  endif
endif

filetype plugin indent on
filetype plugin on

nmap <silent> <Leader>o :NERDTreeToggle<CR>
nmap <silent> <Leader>u :GundoToggle<CR>
nmap <silent> <Leader>i :BufExplorer<CR>
nmap <silent> <Leader>] :FufTagWithCursorWord<CR>
" Edit routes
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb"


if has("gui_running")
  set mouse=a
endif

if has("gui_running") && has("syntax")
  " Show (partial) command in the last line of the screen.
  set showcmd
  function! s:initialize_font()
    if exists("&guifont")
      if has("mac")
        set guifont=Monaco:h12
      elseif has("unix")
        if &guifont == ""
          set guifont=bitstream\ vera\ sans\ mono\ 11
        endif
      elseif has("win32")
        set guifont=Consolas:h11,Courier\ New:h10
      endif
    endif
  endfunction
  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
  noremap <M-,>        :Smaller<CR>
  noremap <M-.>        :Bigger<CR>

  if exists("syntax_on") || exists("syntax_manual")
  else
    syntax on
  endif
  if !exists('g:colors_name')
    colorscheme pyte
  endif

  augroup RCVisual
    autocmd!

    autocmd VimEnter *  if !has("gui_running") | set background=dark notitle noicon | endif
    autocmd GUIEnter *  set background=light title icon cmdheight=2 lines=25 columns=80 guioptions-=T
    autocmd GUIEnter *  if has("diff") && &diff | set columns=165 | endif
    autocmd GUIEnter *  colorscheme pyte
    autocmd GUIEnter *  call s:initialize_font()
    autocmd Syntax css  syn sync minlines=50
    autocmd Syntax csh  hi link cshBckQuote Special | hi link cshExtVar PreProc | hi link cshSubst PreProc | hi link cshSetVariables Identifier
  augroup END
else
  syntax on
  autocmd VimEnter *  if !has("gui_running") | set background=dark notitle noicon | endif
  colorscheme pyte
endif
"autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow
"autocmd BufRead,BufNewFile *.coffee CoffeeCompile watch vert | cwindow
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
map ,. \cc
map ., \cu
if has("mac")
  map <D-/> <leader>c<space>
endif
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
ab prit print
ab fales false
ab flase false
ab treu true
ab teur true
ab ture true
ab retrun return
ab retunr return
ab htis this
ab erturn return

set loadplugins

set tags=./tags

set scrolloff=8

let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:ragtag_global_maps = 1
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

let g:indent_guides_enable_on_vim_startup = 0
let g:pomodoro_notification_cmd = 'terminal-notifier -message "Poromodo Finished" -title "Poromodo" -open "http://gsp-manager.gameon.co.jp/my/page"'
