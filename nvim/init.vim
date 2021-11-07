set completeopt+=preview
set backspace=indent,eol,start " http://vim.wikia.com/wiki/Backspace_and_delete_problems
set expandtab
set encoding=utf-8  " Set encoding
scriptencoding utf-8
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
if $SHELL =~# 'bin/fish'
set shell=/bin/sh
endif
set mouse=a
if has('gui_running')
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
set colorcolumn=80

augroup commit_width
  autocmd!
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

lua require('init')


runtime functions.vim
runtime colors.vim
runtime keymaps.vim

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
  autocmd BufWritePost *.lua luafile %
augroup END

syntax enable
syntax sync fromstart
