vim.cmd([[packadd packer.nvim]])
-- vim._update_package_paths()

return require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("AndrewRadev/switch.vim")
  use("christoomey/vim-tmux-navigator")
  use({
    "dhruvasagar/vim-table-mode",
    config = function()
      pcall(require, "table-mode-config")
    end,
  })
  use({
    "haya14busa/vim-open-googletranslate",
    config = function()
      pcall(require, "open-googletranslate-config")
    end,
  })
  use("honza/vim-snippets")
  use("jgdavey/vim-blockle")
  use({ "junegunn/vader.vim", opt = true })
  use("mattn/emmet-vim")
  use("ntpeters/vim-better-whitespace")
  use("osyo-manga/vim-over")
  use("rizzatti/dash.vim")
  use("rstacruz/vim-xtract")
  use({ "terryma/vim-multiple-cursors", opt = true })
  use("tmhedberg/matchit")
  use("tpope/vim-abolish")
  use("tpope/vim-commentary")
  use("tpope/vim-dispatch")
  use("tpope/vim-endwise")
  use("tpope/vim-fugitive")
  use("tpope/vim-projectionist")
  use({
    "tpope/vim-ragtag",
    config = function()
      pcall(require, "ragtag-config")
    end,
  })
  use("tpope/vim-rhubarb")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("wakatime/vim-wakatime")

  -- mac
  use("MarcWeber/vim-addon-mw-utils")

  -- color
  use("albertorestifo/github.vim")
  use("jacoborus/tender.vim")

  -- syntax
  -- == elixir ==
  use({
    "marocchino/pipe_converter",
    run = "mix do deps.get, compile, escript.build",
    config = function()
      pcall(require, "pipe-converter-config")
    end,
  })
  -- == github-action ==
  use("yasuhiroki/github-actions-yaml.vim")
  -- == markdown ==
  use({
    "plasticboy/vim-markdown",
    config = function()
      pcall(require, "markdown-config")
    end,
  })
  -- == reason ==
  use("reasonml-editor/vim-reason-plus")
  -- == terraform ==
  use({
    "hashivim/vim-terraform",
    config = function()
      pcall(require, "terraform-config")
    end,
  })
  -- == ruby ==
  -- use {
  --   'joker1007/vim-ruby-heredoc-syntax',
  --   config = function() require('ruby-heredoc-syntax-config') end
  -- }
  use("vim-ruby/vim-ruby")
  use("tpope/vim-rails")
  use("tpope/vim-bundler")
  use("tpope/vim-haml")

  -- nvim
  -- use({
  --   "mfussenegger/nvim-lint",
  --   config = function()
  --     pcall(require, "lint-config")
  --   end,
  -- })
  -- use({
  --   "mhartington/formatter.nvim",
  --   config = function()
  --     pcall(require, "formatter-config")
  --   end,
  -- })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      pcall(require, "null-ls-config")
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      pcall(require, "treesitter-config")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter/nvim-treesitter", "kana/vim-textobj-user" },
  })
  use({
    "nvim-treesitter/playground",
    opt = true,
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "romgrk/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      pcall(require, "treesitter-context-config")
    end,
  })
  use({
    "folke/twilight.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      pcall(require, "twilight-config")
    end,
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      pcall(require, "cmp-config")
    end,
  })
  use({
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp", "SirVer/ultisnips" },
  })
  use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } })
  use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } })
  use({ "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } })
  use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" } })
  use({
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      pcall(require, "hop-config")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      pcall(require, "gitsigns-config")
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      pcall(require, "telescope-config")
    end,
  })
  use({
    "nvim-telescope/telescope-symbols.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      pcall(require, "autopairs-config")
    end,
  })
  use({
    "fhill2/telescope-ultisnips.nvim",
    requires = { "nvim-telescope/telescope.nvim", "SirVer/ultisnips" },
  })
  use({
    "AckslD/nvim-neoclip.lua",
    config = function()
      pcall(require, "neoclip-config")
    end,
  })
  use("nvim-telescope/telescope-hop.nvim")
  use({
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "tami5/sql.nvim" },
  })
  use({
    "nvim-neotest/neotest",
    requires = {
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-vim-test",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    config = function()
      pcall(require, "neotest-config")
    end,
  })
  use("github/copilot.vim")

  -- lsp
  -- sql, xml, svg, toml, voldikss/coc-browser
  use("williamboman/nvim-lsp-installer")
  use({
    "neovim/nvim-lspconfig",
    config = function()
      pcall(require, "lsp-config")
    end,
  })
  use("folke/lsp-colors.nvim")
  use({
    "tami5/lspsaga.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      pcall(require, "lspsaga-config")
    end,
  })

  -- style
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      pcall(require, "lualine-config")
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      pcall(require, "tree-config")
    end,
  })
end)
