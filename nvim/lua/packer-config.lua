vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/switch.vim'
  use 'christoomey/vim-tmux-navigator'
  use {
    'dhruvasagar/vim-table-mode',
    config = require('table-mode-config')
  }
  use {
    'haya14busa/vim-open-googletranslate',
    config = require('open-googletranslate-config')
  }
  use 'honza/vim-snippets'
  use 'jgdavey/vim-blockle'
  use { 'junegunn/vader.vim', opt = true }
  use 'mattn/emmet-vim'
  use 'ntpeters/vim-better-whitespace'
  use 'osyo-manga/vim-over'
  use 'rizzatti/dash.vim'
  use 'rstacruz/vim-xtract'
  use { 'terryma/vim-multiple-cursors', opt = true }
  use 'tmhedberg/matchit'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use {
    'tpope/vim-ragtag',
    config = require('ragtag-config')
  }
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wakatime/vim-wakatime'

  -- mac
  use 'MarcWeber/vim-addon-mw-utils'

  -- unix
  use {
    'lyokha/vim-xkbswitch',
    config = require('xkbswitch-config')
  }
  -- color
  use 'albertorestifo/github.vim'
  use 'jacoborus/tender.vim'

  -- syntax
  -- == elixir ==
  use {
    'marocchino/pipe_converter',
    run = 'mix do deps.get, compile, escript.build',
    config = require('pipe-converter-config')
  }
  -- == github-action ==
  use 'yasuhiroki/github-actions-yaml.vim'
  -- == markdown ==
  use {
    'plasticboy/vim-markdown',
    config = require('markdown-config')
  }
  -- == reason ==
  use 'reasonml-editor/vim-reason-plus'
  -- == terraform ==
  use {
    'hashivim/vim-terraform',
    config = require('terraform-config')
  }
  -- == ruby ==
  use {
    'joker1007/vim-ruby-heredoc-syntax',
    config = require('ruby-heredoc-syntax-config')
  }
  use 'tpope/vim-rails'

  -- nvim
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = require('treesitter-config')
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat',
    requires = { 'nvim-treesitter/nvim-treesitter', 'kana/vim-textobj-user' }
  }
  use {
    'nvim-treesitter/playground',
    opt = true,
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use {
   'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = require('treesitter-context-config')
  }
  use {
    'folke/twilight.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = require('twilight-config')
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }
  use 'nvim-lua/completion-nvim'
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = require('hop-config')
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('gitsigns-config')
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('telescope-config')
  }
  use {
    'windwp/nvim-autopairs',
    config = require('autopairs-config')
  }
  use {
    'fhill2/telescope-ultisnips.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'SirVer/ultisnips' }
  }
  use {
    'AckslD/nvim-neoclip.lua',
    config = require('neoclip-config')
  }
  use 'nvim-telescope/telescope-hop.nvim'
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = { 'tami5/sql.nvim' }
  }
  use {
    'hrsh7th/nvim-compe',
    requires = { 'SirVer/ultisnips' },
    config = require('compe-config')
  }
  use {
    'rcarriga/vim-ultest',
    requires = { 'vim-test/vim-test' },
    run = ':UpdateRemotePlugins',
    config = require('ultest-config')
  }
  use {
    'vim-test/vim-test',
    config = require('test-config')
  }
  use 'github/copilot.vim'

  -- lsp
  -- sql, xml, svg, toml, voldikss/coc-browser
  use 'kabouzeid/nvim-lspinstall'
  use {
    'neovim/nvim-lspconfig',
    config = require('lsp-config')
  }
  use 'folke/lsp-colors.nvim'
  use {
    'glepnir/lspsaga.nvim',
    requires = { 'neovim/nvim-lspconfig' },
    config = require('lspsaga-config')
  }

  -- style
  use {
    'kyazdani42/nvim-web-devicons',
    opt = true,
    config = require('web-devicons-config')
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('lualine-config')
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require'nvim-tree'.setup {} end
  }
end)
