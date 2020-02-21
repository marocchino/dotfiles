" 交換性を無くす。
set nocompatible
filetype off                   " required!

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('AndrewRadev/switch.vim')
call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('SirVer/ultisnips')
call minpac#add('Townk/vim-autoclose')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('andyl/vim-textobj-elixir', {'type': 'opt'})
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('c-brenn/fuzzy-projectionist.vim')
call minpac#add('dhruvasagar/vim-table-mode')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('haya14busa/vim-open-googletranslate')
call minpac#add('honza/vim-snippets')
call minpac#add('jgdavey/vim-blockle')
call minpac#add('janko-m/vim-test')
call minpac#add('junegunn/fzf.vim')
call minpac#add('kana/vim-textobj-user', {'type': 'opt'})
call minpac#add('lyokha/vim-xkbswitch')
call minpac#add('mattn/emmet-vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('osyo-manga/vim-over')
call minpac#add('prettier/vim-prettier', { 'do': '!npm install' })
call minpac#add('rizzatti/dash.vim')
call minpac#add('ruanyl/coverage.vim')
call minpac#add('szw/vim-tags')
call minpac#add('terryma/vim-multiple-cursors', {'type': 'opt'})
call minpac#add('tmhedberg/matchit')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tomtom/tlib_vim')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-ragtag')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')
call minpac#add('wakatime/vim-wakatime')
call minpac#add('junegunn/vader.vim')
if has('nvim')
  call minpac#add('radenling/vim-dispatch-neovim')
else
  call minpac#add('prabirshrestha/async.vim')
endif

" style
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('edkolev/tmuxline.vim')

" color
call minpac#add('tssm/fairyfloss.vim')
call minpac#add('albertorestifo/github.vim')

" syntax
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mxw/vim-jsx')
call minpac#add('othree/yajs.vim')
" == css ==
call minpac#add('ap/vim-css-color')
" == elixir ==
call minpac#add('avdgaag/vim-phoenix')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('marocchino/pipe_converter')
" == html ==
call minpac#add('othree/html5.vim')
" == golang ==
call minpac#add('fatih/vim-go')
" == graphql ==
call minpac#add('jparise/vim-graphql')
" == markdown ==
call minpac#add('plasticboy/vim-markdown')
" == rust ==
call minpac#add('rust-lang/rust.vim')
" == reason ==
call minpac#add('reasonml-editor/vim-reason-plus')
" == terraform ==
call minpac#add('hashivim/vim-terraform')
" == elm ==
" call minpac#add('ElmCast/elm-vim')
" == idris ==
" call minpac#add('idris-hackers/idris-vim')
" == ruby ==
" call minpac#add('joker1007/vim-ruby-heredoc-syntax')
" call minpac#add('tpope/vim-rails')
" call minpac#add('vim-ruby/vim-ruby')
" == vue ==
" call minpac#add('posva/vim-vue')

filetype on
filetype indent on
filetype plugin on

set backspace=indent,eol,start " http://vim.wikia.com/wiki/Backspace_and_delete_problems
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
" Prevents redrawing during automated tasks.
set lazyredraw
set loadplugins
set magic           " regexp like movement
set nrformats=bin,octal,hex
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
set softtabstop=2
set synmaxcol=800
set tabstop=2
set tags=./tags
set textwidth=80
set ttimeoutlen=50  " Make ESC work faster
set wildmenu
set wrap
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif
set mouse=a
if has("gui_running")
  set guioptions-=r   " remove right scroll-bar (macvim)
  set macligatures
  set guifont=Fira\ Code\ Retina:h12
endif
if has('nvim')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundle and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/o*

" Disable OS X index files
set wildignore+=.DS_Store

let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = expand('~/dotfiles/bash/libInputSourceSwitcher.dylib')
let g:pipe_converter_command = "~/.vim/plugged/pipe_converter/pipe_converter"

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 0
" adding the custom source to unite
let g:webdevicons_enable_unite = 0
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 0
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 0
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 0
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

let g:airline_powerline_fonts = 1

if filereadable(expand('~/.toggle_dark'))
  let g:airline_theme='violet'
else
  let g:airline_theme='papercolor'
endif

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.paste = "\uf0ea"
let g:airline_symbols.readonly = "\ue0a2"
let g:airline_symbols.modified = "\uf459"
let g:airline_symbols.spell = "\uf49e"
let g:airline_symbols.branch = "\uf418"
let g:airline_section_x = ''

" let g:airline_left_sep = "\uE0B4"
" let g:airline_left_alt_sep = "\uE0B5"
" let g:airline_right_sep = "\uE0B6"
" let g:airline_right_alt_sep = "\uE0B7"

let g:ale_linters = {
\   'elixir': ['credo'],
\   'ruby': ['rubocop'],
\   'javascript': ['eslint', 'prettier'],
\   'markdown': ['mdl'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'vim': ['vint'],
\   'go': ['golint', 'govet', 'errcheck'],
\}

let g:ale_fix_on_save = 1
let g:ale_sign_error = "\uF05E"
let g:ale_sign_warning = "\uF071"

let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_uncovered = "\uF070"

let g:elm_format_autosave = 1

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)<Paste>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let g:mix_format_on_save = 1

let g:table_mode_corner_corner='|'
let g:table_mode_header_fillchar='-'

let test#strategy = "dispatch"

let g:opengoogletranslate#openbrowsercmd = 'open'
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsSnippetsDir = $HOME.'/dotfiles/vim/UltiSnips'

nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)

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
\ "markdown" : {
\   "start" : "MD",
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
set termguicolors

if filereadable(expand('~/.toggle_dark'))
  colorscheme fairyfloss
else
  colorscheme github
endif

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" http://mattn.kaoriya.net/software/vim/20150209151638.htm
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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

augroup reload_vim
  autocmd!
  autocmd BufWritePost *.vim source %
augroup END

augroup reload_vue_every_time
  autocmd!
  autocmd FileType vue syntax sync fromstart
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
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
if has('nvim')
  " nnoremap :ter :split|terminal
  tnoremap <C-W> <C-\><C-n>
  tnoremap <silent> <C-H> <C-\><C-n>:wincmd h<CR>
  tnoremap <silent> <C-J> <C-\><C-n>:wincmd j<CR>
  tnoremap <silent> <C-K> <C-\><C-n>:wincmd k<CR>
  tnoremap <silent> <C-L> <C-\><C-n>:wincmd l<CR>
else
  tnoremap <silent> <C-H> <C-W>:wincmd h<CR>
  tnoremap <silent> <C-J> <C-W>:wincmd j<CR>
  tnoremap <silent> <C-K> <C-W>:wincmd k<CR>
  tnoremap <silent> <C-L> <C-W>:wincmd l<CR>
  tnoremap <silent> <C-N> <C-W>N
endif
nnoremap <C-]> g<C-]>
nnoremap <esc><esc> :nohlsearch<CR>
nnoremap <Leader>[ :tabp<CR>
nnoremap <Leader>] :tabn<CR>
nnoremap <Leader>f :Rg<Space>
nnoremap <Leader>r :call VisualFindAndReplace()<CR>
xnoremap <Leader>r :call VisualFindAndReplaceWithSelection()<CR>
nmap <Leader><Leader> <c-^>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <C-b> :call fzf#run({
  \   'source':  reverse(<sid>buflist()),
  \   'sink':    function('<sid>bufopen'),
  \   'options': '+m',
  \   'down':    len(<sid>buflist()) + 2
  \ })<CR>

noremap Q <Nop>
noremap q: :q
noremap ; :
noremap bd :wall \| bd<cr>
nnoremap - :Switch<cr>
" Use command d on top of a word to look it up in Dictionary.app
nnoremap <silent> <D-d> :silent !open dict://<cword><CR>
nnoremap <silent> <C-d> :Dash<CR>
nnoremap <silent> <C-p> :FZF<CR>
nnoremap S i<cr><esc><right>
vmap <Enter> <Plug>(EasyAlign)

map ,. :TComment<CR>
map ., :TComment<CR>

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

syntax enable
syntax sync fromstart

" Local configure
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
