" 交換性を無くす。
set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" let Vundle manage Vundle
" required!
Plugin 'AndrewRadev/switch.vim'
Plugin 'AnsiEsc.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'andyl/vim-textobj-elixir'
Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'haya14busa/vim-open-googletranslate'
Plugin 'honza/vim-snippets'
Plugin 'jgdavey/vim-blockle'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'marocchino/pipe_converter'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'osyo-manga/vim-over'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/syntastic'
Plugin 'szw/vim-tags'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/matchit'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" color
Plugin 'summerfruit256.vim'
Plugin 'Lokaltog/vim-distinguished'

" formatter
Plugin 'ElmCast/elm-vim'
Plugin 'ap/vim-css-color'
Plugin 'avdgaag/vim-phoenix'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'joker1007/vim-ruby-heredoc-syntax'
Plugin 'jparise/vim-graphql'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'othree/yajs.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()            " required

filetype on
filetype indent on
filetype plugin on

set backspace=indent,eol,start
set expandtab
set encoding=utf-8  " Set encoding
set fileencoding=utf-8  " Set encoding
set fileencodings=utf-8,cp949,cp932,euc-jp,shift-jis,euc-kr,big5,ucs-2le,latin1
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
set spelllang=en_us,cjk " remove cjk words from spell check list
set spell
set splitbelow      " Open new split panes to right and bottom, which feels more natural
set splitright
set statusline=%#ErrorMsg#%#StatusLine#[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P
set sts=2
set tabstop=2
set tags=./tags
set textwidth=80
set ttimeoutlen=50  " Make ESC work faster
set wildmenu
set wrap
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif
if has("gui_running")
  set mouse=a
  set guioptions-=r   " remove right scrollbar (macvim)
  set macligatures
  set guifont=Fira\ Code\ Retina:h12
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

" Disable OS X index files
set wildignore+=.DS_Store

let g:elm_format_autosave = 1
let g:opengoogletranslate#openbrowsercmd = 'open'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
\ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
\ }
nnoremap <C-b> :CtrlPBuffer<cr>

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checker = ["elixir"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
augroup mySyntastic
  autocmd!
  autocmd FileType tex let b:syntastic_mode = "active"
augroup END

" === vim-ruby-heredoc-syntax ===
" Add syntax rule
let g:ruby_heredoc_syntax_defaults = {
\ "graphql" : {
\   "start" : "GRAPHQL",
\ },
\ "json" : {
\   "start" : "JSON",
\ },
\ "sql" : {
\   "start" : "SQL",
\ },
\}

let g:vim_tags_auto_generate = 1

let g:vim_markdown_fenced_languages = [
\ 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'ruby=rb', 'python=py',
\ 'markdown=md', 'javascript=js', 'elixir=elixir']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

let g:multi_cursor_use_default_mapping = 0
" Default mapping
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-N>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Exclude JavaScript files in :Rtags via rails.vim due to warnings when parsing
" let g:Tlist_Ctags_Cmd = "ctags --exclude='*.js'"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:ragtag_global_maps = 1

let g:indent_guides_enable_on_vim_startup = 0

let g:rails_projections = {
\ "frontend/src/views/*.jade": {
\   "command": "design"
\ },
\ "frontend/src/scripts/*.coffee": {
\   "command": "coffee",
\   "test": "frontend/spec/{}_spec.coffee"
\ },
\ "app/decorators/*_decorator.rb": {
\   "command": "decorator",
\   "template":
\     ["class {camelcase|capitalize|colons}Decorator < "
\      . "Draper::Decorator", "  delegate_all", "end"],
\   "test": "spec/decorators/{}_decorator_spec.rb"
\ },
\ "app/forms/*_form.rb": {
\   "command": "form",
\   "template":
\     ["class {camelcase|capitalize|colons}Form < ",
\      "  include Virtus.model",
\      "  include ActiveModel::Model", "end"],
\   "test": "spec/forms/{}_form_spec.rb"
\ },
\ "app/jobs/*_job.rb": {
\   "command": "job",
\   "template":
\     ["class {camelcase|capitalize|colons}Job < "
\      . "ActiveJob::Base", "  def perform", "  end", "end"],
\   "test": "spec/jobs/{}_job_spec.rb"
\ },
\ "lib/*.rb": {
\   "command": "lib",
\   "test": "spec/lib/{}_spec.rb"
\ },
\ "app/services/*.rb": {
\   "command": "service",
\   "test": "spec/services/{}_spec.rb"
\ },
\ "app/validators/*_validator.rb": {
\   "command": "service",
\   "test": "spec/validators/{}_validator_spec.rb"
\ },
\ "app/uploaders/*_uploader.rb": {
\   "command": "uploader",
\   "template":
\     ["class {camelcase|capitalize|colons}Uploader < "
\      . "CarrierWave::Uploader::Base", "end"],
\   "test": "spec/models/{}_uploader_spec.rb",
\   "keywords": "process version"
\ }}



" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-zenkaku
""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
scriptencoding utf-8

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
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

augroup debugger_highlight
  autocmd!
  autocmd BufEnter *.ex syn match Error "IO.puts\|IO.inspect"
  autocmd BufEnter *.rb syn match Error "binding.pry\|debugger"
  autocmd BufEnter *.{js,coffee} syn match Error "console.log"
augroup END

augroup auto_save
  autocmd!
  autocmd BufLeave,FocusLost * silent! update
augroup END

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup commit_width
  autocmd!
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

augroup elixir_pipe_converter
  autocmd!
  autocmd FileType elixir nnoremap ec :call PipeConvert()<CR>
  autocmd FileType elixir nnoremap er :call PipeRevert()<CR>
augroup END

" move windows with hjkl
" nnoremap <silent> <C-H> :wincmd h<CR>
" nnoremap <silent> <C-J> :wincmd j<CR>
" nnoremap <silent> <C-K> :wincmd k<CR>
" nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <C-]> g<C-]>
nnoremap <esc><esc> :nohlsearch<CR>
nnoremap <Leader>r :VimuxPromptCommand "!!"<CR><CR>
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
nmap <Leader><Leader> <c-^>

nnoremap - :Switch<cr>
" Use command d on top of a word to look it up in Dictionary.app
nnoremap <silent> <D-d> :!open dict://<cword><CR><CR>
nnoremap <silent> <D-e> :Dash<CR>
vmap <Enter> <Plug>(EasyAlign)

map ,. :TComment<CR>
map ., :TComment<CR>

syntax enable
syntax sync fromstart

" Local configure
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
