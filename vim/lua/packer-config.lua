vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()

return require('packer').startup(function()
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
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
end)
