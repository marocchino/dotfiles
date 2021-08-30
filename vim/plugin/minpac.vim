packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('AndrewRadev/switch.vim')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('dhruvasagar/vim-table-mode')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('haya14busa/vim-open-googletranslate')
call minpac#add('honza/vim-snippets')
call minpac#add('janko-m/vim-test')
call minpac#add('jgdavey/vim-blockle')
call minpac#add('junegunn/vader.vim', {'type': 'opt'})
call minpac#add('kana/vim-textobj-user')
call minpac#add('mattn/emmet-vim')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('osyo-manga/vim-over')
call minpac#add('rizzatti/dash.vim')
call minpac#add('rstacruz/vim-xtract')
call minpac#add('terryma/vim-multiple-cursors', {'type': 'opt'})
call minpac#add('tmhedberg/matchit')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tomtom/tlib_vim')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-ragtag')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('wakatime/vim-wakatime')

if has("mac")
  call minpac#add('MarcWeber/vim-addon-mw-utils')
endif

if has("unix")
  call minpac#add('lyokha/vim-xkbswitch')
endif

if has('nvim')
  call minpac#add('wbthomason/packer.nvim', {'type': 'opt'})
endif

" coc
" call minpac#add('fannheyward/coc-sql', { 'do': '!yarn install --frozen-lockfile' })
" call minpac#add('fannheyward/coc-xml', { 'do': '!yarn install --frozen-lockfile' })
" call minpac#add('iamcco/coc-svg', { 'do': '!yarn install --frozen-lockfile' })
" call minpac#add('kkiyama117/coc-toml', { 'do': '!yarn install --frozen-lockfile' })
" call minpac#add('neoclide/coc-tabnine', { 'do': '!yarn install --frozen-lockfile' })
" call minpac#add('voldikss/coc-browser', { 'do': '!yarn install --frozen-lockfile' })

" color
call minpac#add('albertorestifo/github.vim')
call minpac#add('jacoborus/tender.vim')

" syntax

" == js,ts ==
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('MaxMEllon/vim-jsx-pretty')
" == css ==
call minpac#add('ap/vim-css-color')
" == elixir ==
call minpac#add('avdgaag/vim-phoenix')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('marocchino/pipe_converter', { 'do': '!mix do deps.get, compile, escript.build' })
call minpac#add('andyl/vim-textobj-elixir')
" == html ==
call minpac#add('sheerun/html5.vim')
" == golang ==
call minpac#add('fatih/vim-go')
" == graphql ==
call minpac#add('jparise/vim-graphql')
" == github-action ==
call minpac#add('yasuhiroki/github-actions-yaml.vim')
" == markdown ==
call minpac#add('plasticboy/vim-markdown')
" == rust ==
call minpac#add('rust-lang/rust.vim')
" == reason ==
call minpac#add('reasonml-editor/vim-reason-plus')
" == terraform ==
call minpac#add('hashivim/vim-terraform')
" == toml ==
call minpac#add('cespare/vim-toml')
" == elm ==
call minpac#add('ElmCast/elm-vim')
" == idris ==
call minpac#add('idris-hackers/idris-vim')
" == ruby ==
call minpac#add('joker1007/vim-ruby-heredoc-syntax')
call minpac#add('tpope/vim-rails')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('keith/rspec.vim')
" == vue ==
" call minpac#add('posva/vim-vue')
