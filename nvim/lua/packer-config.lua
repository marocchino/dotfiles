vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/switch.vim'
  use 'christoomey/vim-tmux-navigator'
  use {
    'dhruvasagar/vim-table-mode',
    config = function() require('table-mode-config') end
  }
  use {
    'haya14busa/vim-open-googletranslate',
    config = function() require('open-googletranslate-config') end
  }
  use 'honza/vim-snippets'
  use 'jgdavey/vim-blockle'
  use {'junegunn/vader.vim', opt = true}
  use 'mattn/emmet-vim'
  use 'ntpeters/vim-better-whitespace'
  use 'osyo-manga/vim-over'
  use 'rizzatti/dash.vim'
  use 'rstacruz/vim-xtract'
  use {'terryma/vim-multiple-cursors', opt = true}
  use 'tmhedberg/matchit'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use {'tpope/vim-ragtag', config = function() require('ragtag-config') end}
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wakatime/vim-wakatime'

  -- mac
  use 'MarcWeber/vim-addon-mw-utils'

  -- color
  use 'albertorestifo/github.vim'
  use 'jacoborus/tender.vim'

  -- syntax
  -- == elixir ==
  use {
    'marocchino/pipe_converter',
    run = 'mix do deps.get, compile, escript.build',
    config = function() require('pipe-converter-config') end
  }
  -- == github-action ==
  use 'yasuhiroki/github-actions-yaml.vim'
  -- == markdown ==
  use {
    'plasticboy/vim-markdown',
    config = function() require('markdown-config') end
  }
  -- == reason ==
  use 'reasonml-editor/vim-reason-plus'
  -- == terraform ==
  use {
    'hashivim/vim-terraform',
    config = function() require('terraform-config') end
  }
  -- == ruby ==
  -- use {
  --   'joker1007/vim-ruby-heredoc-syntax',
  --   config = function() require('ruby-heredoc-syntax-config') end
  -- }
  use 'tpope/vim-rails'

  -- nvim
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function() require('treesitter-config') end
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat',
    requires = {'nvim-treesitter/nvim-treesitter', 'kana/vim-textobj-user'}
  }
  use {
    'nvim-treesitter/playground',
    opt = true,
    requires = {'nvim-treesitter/nvim-treesitter'}
  }
  use {
    'romgrk/nvim-treesitter-context',
    requires = {'nvim-treesitter/nvim-treesitter'},
    config = function() require('treesitter-context-config') end
  }
  use {
    'folke/twilight.nvim',
    requires = {'nvim-treesitter/nvim-treesitter'},
    config = function() require('twilight-config') end
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = {'nvim-treesitter/nvim-treesitter'}
  }
  use 'nvim-lua/completion-nvim'
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function() require('hop-config') end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns-config') end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('telescope-config') end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('autopairs-config') end
  }
  use {
    'fhill2/telescope-ultisnips.nvim',
    requires = {'nvim-telescope/telescope.nvim', 'SirVer/ultisnips'}
  }
  use {
    'AckslD/nvim-neoclip.lua',
    config = function() require('neoclip-config') end
  }
  use 'nvim-telescope/telescope-hop.nvim'
  use {'nvim-telescope/telescope-frecency.nvim', requires = {'tami5/sql.nvim'}}
  use {
    'hrsh7th/nvim-compe',
    requires = {'SirVer/ultisnips'},
    config = function() require('compe-config') end
  }
  use {
    'rcarriga/vim-ultest',
    requires = {'vim-test/vim-test'},
    run = ':UpdateRemotePlugins',
    config = function() require('ultest-config') end
  }
  use {'vim-test/vim-test', config = function() require('test-config') end}
  use 'github/copilot.vim'

  -- lsp
  -- sql, xml, svg, toml, voldikss/coc-browser
  use 'kabouzeid/nvim-lspinstall'
  use {'neovim/nvim-lspconfig', config = function() require('lsp-config') end}
  use 'folke/lsp-colors.nvim'
  use {
    'glepnir/lspsaga.nvim',
    requires = {'neovim/nvim-lspconfig'},
    config = function() require('lspsaga-config') end
  }

  -- style
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('lualine-config') end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require'nvim-tree'.setup {} end
  }
end)