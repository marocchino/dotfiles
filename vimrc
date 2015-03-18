" 交換性を無くす。
set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'AndrewRadev/switch.vim'
Plugin 'AnsiEsc.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctags.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edsono/vim-matchit'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-vspec'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ngmy/vim-rubocop'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-unimpaired'

" color
Plugin 'summerfruit256.vim'

" formatter
Plugin 'dag/vim-fish'
Plugin 'digitaltoad/vim-jade'
Plugin 'dsawardekar/ember.vim'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'xenoterracide/html.vim'

call vundle#end()            " required

filetype on
filetype indent on
filetype plugin on

set backspace=indent,eol,start
set expandtab
set fileencoding=utf-8  " Set encoding
set fileencodings=utf-8,cp949,cp932,euc-jp,shift-jis,euc-kr,big5,ucs-2le,latin1
set guioptions-=r   " remove right scrollbar (macvim)
set hidden          " allow buffer change in unsaved file
set history=50
set hlsearch
set incsearch       " do incremental searching
set laststatus=2    " To display the status line always
set list
set listchars=tab:»·,trail:·,extends:»,precedes:«,nbsp:%
set loadplugins
set magic           " regexp like movement
set nobackup
set noswapfile      " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set number          " Show line number
set numberwidth=5
set ruler           " show the cursor position all the time
set scrolloff=8
set shiftwidth=2
set showcmd         " display incomplete commands
set spelllang=en_us,cjk " remove cjk words from spellcecklist
set splitbelow      " Open new split panes to right and bottom, which feels more natural
set splitright
set statusline=%#ErrorMsg#%#StatusLine#[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P
set sts=2
set tabstop=2
set tags=./tags
" set term=cons25     " for putty
set ttimeoutlen=50  " Make Esc work faster
set wildmenu
set wrap
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif
if has("gui_running")
  set mouse=a
endif

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable osx index files
set wildignore+=.DS_Store

hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
nnoremap <C-b> :CtrlPBuffer<cr>
" CtrlP Delete
call ctrlp_bdelete#init()
" CtrlP Funky
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  autocmd!
  autocmd FileType tex let b:syntastic_mode = "passive"
augroup END


" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:ragtag_global_maps = 1

let g:indent_guides_enable_on_vim_startup = 0


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


" Color scheme
colorscheme summerfruit256
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" http://mattn.kaoriya.net/software/vim/20150209151638.htm
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

"autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow
"autocmd BufRead,BufNewFile *.coffee CoffeeCompile watch vert | cwindow

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

autocmd BufEnter *.rb syn match error contained "\<binding.pry\>"
autocmd BufEnter *.rb syn match error contained "\<debugger\>"
autocmd BufEnter *.js syn match error contained "\<console.log\>"
autocmd BufEnter *.coffee syn match error contained "\<console.log\>"
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufLeave,FocusLost * silent! update

" autocmd BufWritePre *.{rb|erb|py|js|coffee|html} :%s/\s\+$//e
" autocmd BufWritePre *.{rb|erb|py|coffee} :retab

" move windows with hjkl
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <esc><esc> :nohlsearch<CR>

nnoremap - :Switch<cr>
" Use command d on top of a word to look it up in Dictionary.app
nnoremap <silent> <D-d> :!open dict://<cword><CR><CR>
nnoremap <silent> <D-e> :Dash<CR>
vmap <Enter> <Plug>(EasyAlign)

map ,. :TComment<CR>
map ., :TComment<CR>

syntax enable
syntax sync fromstart

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
