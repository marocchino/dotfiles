vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()

return require('packer').startup(function()
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate'}
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
  }
  use {
    'folke/twilight.nvim',
    requires = {'nvim-treesitter/nvim-treesitter'},
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = {'nvim-treesitter/nvim-treesitter'},
  }
  use {'nvim-lua/completion-nvim'}
  use {'phaazon/hop.nvim', as = 'hop'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {'windwp/nvim-autopairs'}
  use {
    'fhill2/telescope-ultisnips.nvim',
    requires = {'nvim-telescope/telescope.nvim', 'SirVer/ultisnips'}
  }
  use {'AckslD/nvim-neoclip.lua'}
  use {'nvim-telescope/telescope-hop.nvim'}
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'tami5/sql.nvim'}
  }
  use {
    'hrsh7th/nvim-compe',
    requires = {'SirVer/ultisnips'}
  }
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use { "vim-test/vim-test" }

  -- lsp
  use {'kabouzeid/nvim-lspinstall'}
  use {'neovim/nvim-lspconfig'}
  use {'folke/lsp-colors.nvim'}
  use {
    'glepnir/lspsaga.nvim',
    requires = {'neovim/nvim-lspconfig'}
  }

  -- style
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
end)
