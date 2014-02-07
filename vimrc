" 交換性を無くす。
set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'AndrewRadev/switch.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'croaky/vim-colors-github'
Bundle 'edsono/vim-matchit'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kana/vim-vspec'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nono/vim-handlebars'
Bundle 'dsawardekar/ember.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'rcyrus/snipmate-snippets-rubymotion'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/ctags.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'xenoterracide/html.vim'


" for history
set history=50
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set guioptions-=r " remove right scrollbar (macvim)

set statusline=%#ErrorMsg#%#StatusLine#[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P

" To display the status line always
set laststatus=2

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
set numberwidth=5
" Set encoding
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,euc-kr,big5,ucs-2le,latin1
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif
set langmap=ㅂq,ㅈw,ㄷe,ㄱr,ㅅt,ㅛy,ㅕu,ㅑi,ㅐo,ㅔp,ㅁa,ㄴs,ㅇd,ㄹf,ㅎg,ㅗh,ㅓj,ㅏk,ㅣl,ㅋz,ㅌx,ㅊc,ㅍv,ㅠb,ㅜn,ㅡm,ㅃQ,ㅉW,ㄸE,ㄲR,ㅆT,ㅒO,ㅖP


" tab select
set tabstop=2 sts=2 shiftwidth=2 expandtab

" autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre * :retab
autocmd InsertEnter * hi StatusLine guibg=#a0a080 ctermfg=Yellow
autocmd InsertLeave * hi StatusLine guibg=#8090a0 ctermfg=White
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

set wrap
" for regexp like movement
set magic


filetype on
filetype indent on
filetype plugin on

nmap <silent> <Leader>i :BufExplorer<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

nnoremap - :Switch<cr>


" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

set list listchars=tab:»·,trail:·,extends:»,precedes:«,nbsp:%

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-zenkaku
""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if has("gui_running")
  set mouse=a
endif

" Color scheme
colorscheme github
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
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
map ,. :TComment<CR>
map ., :TComment<CR>
map <D-/> :TComment<CR>

set loadplugins

set tags=./tags

set scrolloff=8

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set syntax highlighting for specific file types
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
