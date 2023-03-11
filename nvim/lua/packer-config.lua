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
    "kraftwerk28/gtranslate.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      pcall(require, "gtranslate-config")
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
  use("jacoborus/tender.vim")

  -- chatgpt
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- treesitter
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
  -- Completion framework:
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      pcall(require, "cmp-config")
    end,
  })

  -- Useful completion sources:
  use({ "hrsh7th/cmp-nvim-lua", requires = { "hrsh7th/nvim-cmp" } })
  use({
    "hrsh7th/cmp-nvim-lsp-signature-help",
    requires = { "hrsh7th/nvim-cmp" },
  })
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } })
  use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } })
  use({ "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } })
  -- LSP completion source:
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
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
    },
    config = function()
      pcall(require, "neotest-config")
    end,
  })
  use("github/copilot.vim")

  -- lsp
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use({
    "neovim/nvim-lspconfig",
    config = function()
      pcall(require, "lsp-config")
    end,
  })
  use("folke/lsp-colors.nvim")
  use({
    'simrat39/inlay-hints.nvim',
    config = function()
      pcall(require, "inlay-hints-config")
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      pcall(require, "null-ls-config")
    end,
  })

  -- style
  use({
    "hoob3rt/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      pcall(require, "lualine-config")
    end,
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      pcall(require, "tree-config")
    end,
  })

  -- language specifics
  -- github-action
  use("yasuhiroki/github-actions-yaml.vim")
  -- markdown
  use({
    "plasticboy/vim-markdown",
    config = function()
      pcall(require, "markdown-config")
    end,
  })
  -- terraform
  use({
    "hashivim/vim-terraform",
    config = function()
      pcall(require, "terraform-config")
    end,
  })
  -- ruby
  use("vim-ruby/vim-ruby")
  use("tpope/vim-rails")
  use("tpope/vim-bundler")
  -- rust
  use({
    "simrat39/rust-tools.nvim",
    config = function()
      pcall(require, "rust-tools-config")
    end,
  })
  -- go
  use({
    "ray-x/go.nvim",
    requires = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      pcall(require, "go-config")
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()'
  })
end)
