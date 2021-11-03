" 交換性を無くす。
set nocompatible
set completeopt+=preview
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
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
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

" Color scheme
set termguicolors

" http://mattn.kaoriya.net/software/vim/20150209151638.htm
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
lua require('init')

let g:python3_host_prog = '/usr/local/bin/python3'

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-zenkaku
""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
scriptencoding utf-8

" https://github.com/gibfahn/dot/commit/6b7f23ab4d127fbadfe9234716b6df8347d1521a
" Open path or URL using system open command.
function! Browse(pathOrUrl)
  " This doesn't work with /usr/bin/vim on macOS (doesn't identify as macOS).
  if has('mac')| let openCmd = 'open'| else| let openCmd = 'xdg-open'| endif
    silent execute "! " . openCmd . " " . shellescape(a:pathOrUrl, 1)| " Escape Path or URL and pass as arg to open command.
    echo openCmd . " " shellescape(a:pathOrUrl, 1)| " Echo what we ran so it's visible.
endfunction
command! -nargs=1 Browse call Browse(<q-args>)|

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


if filereadable(expand('~/.toggle_dark'))
  colorscheme tender
else
  colorscheme github
endif

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0


match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup debugger_highlight
  autocmd!
  autocmd BufEnter *.ex syn match Error "IO.puts\|IO.inspect"
  autocmd BufEnter *.rb syn match Error "binding.pry\|debugger"
  autocmd BufEnter *.{js,coffee} syn match Error "console.log"
augroup END

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

augroup auto_save
  autocmd!
  autocmd BufLeave,FocusLost * silent! update
augroup END

augroup reload_vim_config
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

augroup converter
  autocmd!
  autocmd FileType elixir nnoremap ec :call PipeConvert()<CR>
  autocmd FileType elixir nnoremap er :call PipeRevert()<CR>
  autocmd FileType elixir nnoremap td :call ToggleDo()<CR>
  autocmd FileType elixir nnoremap tw :call ToggleWith()<CR>
  autocmd FileType elixir nnoremap em :call ExpandMulti()<CR>
  autocmd FileType ruby nnoremap td :call ToggleEndless()<CR>
augroup END

" move windows with hjkl
" nnoremap :ter :split|terminal
tnoremap <C-W> <C-\><C-n>
tnoremap <silent> <C-H> <C-\><C-n>:wincmd h<CR>
tnoremap <silent> <C-J> <C-\><C-n>:wincmd j<CR>
tnoremap <silent> <C-K> <C-\><C-n>:wincmd k<CR>
tnoremap <silent> <C-L> <C-\><C-n>:wincmd l<CR>
nnoremap <C-]> g<C-]>
nnoremap <esc><esc> :nohlsearch<CR>
nnoremap <silent><leader>[ :tabp<CR>
nnoremap <silent><leader>] :tabn<CR>
nnoremap <silent><leader>f :Rg<Space>
nnoremap <silent><leader>r :call VisualFindAndReplace()<CR>
xnoremap <silent><leader>r :call VisualFindAndReplaceWithSelection()<CR>
nnoremap <silent><leader>e :NvimTreeToggle<CR>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> <Plug>(ultest-run-nearest)
nmap <silent> t<C-f> <Plug>(ultest-run-file)
nmap <silent> t<C-j> <Plug>(ultest-summary-jump)
nmap <silent> t<C-t> <Plug>(ultest-summary-toggle)
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> [t <Plug>(ultest-next-fail)
nmap <silent> ]t <Plug>(ultest-prev-fail)

augroup ruby_fail_ultests
  autocmd!
  autocmd FileType ruby nmap <silent> t<C-n> :TestNearest<CR>
  autocmd FileType ruby nmap <silent> t<C-f> :TestFile<CR>
augroup END


" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.buf.formatting_sync()<CR>
nnoremap <silent><leader>t <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent><leader>w :HopWord<CR>
nnoremap <silent><leader>l :HopLine<CR>
nnoremap <silent><leader>p :HopPattern<CR>
nnoremap <silent><leader>h :HopChar1<CR>
nnoremap <silent><leader>h2 :HopChar2<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nmap <leader><leader> <c-^>
nmap <silent> [w <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <silent> ]w <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent><leader>ff <cmd>Telescope frecency<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>b <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent><leader>fs <cmd>Telescope ultisnips<cr>
nnoremap <silent><leader>fc <cmd>Telescope neoclip<cr>

noremap Q <Nop>
noremap q: :q
noremap ; :
noremap bd :wall \| bd<cr>
nnoremap - :Switch<cr>
" Use command d on top of a word to look it up in Dictionary.app
nnoremap <silent> <D-d> :silent !open dict://<cword><CR>
nnoremap <silent> <C-d> :Dash<CR>
nnoremap S i<cr><esc><right>
vmap <Enter> <Plug>(EasyAlign)
tnoremap <silent> <C-[> <C-\><C-n>

" vim-commentary
nmap ,. gcc
nmap ., gcc
xmap ,. gc
xmap ., gc
omap ,. gc
omap ., gc

syntax enable
syntax sync fromstart
