local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- optional configuration
  "AndrewRadev/switch.vim",
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.g.table_mode_corner_corner = "|"
      vim.g.table_mode_header_fillchar = "-"
    end,
  },
  {
    "uga-rosa/translate.nvim",
    config = function()
      pcall(require, "translate-config")
    end,
  },
  "honza/vim-snippets",
  "jgdavey/vim-blockle",
  "mattn/emmet-vim",
  "ntpeters/vim-better-whitespace",
  "osyo-manga/vim-over",
  "rizzatti/dash.vim",
  "rstacruz/vim-xtract",
  "terryma/vim-multiple-cursors",
  "tmhedberg/matchit",
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-dispatch",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-projectionist",
  {
    "tpope/vim-ragtag",
    config = function()
      vim.g.ragtag_global_maps = 1
    end,
  },
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "wakatime/vim-wakatime",
  -- mac
  "MarcWeber/vim-addon-mw-utils",

  -- color
  "jacoborus/tender.vim",

  -- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      pcall(require, "treesitter-config")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter", "kana/vim-textobj-user" },
  },
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "romgrk/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { enable = true },
  },
  {
    "folke/twilight.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      pcall(require, "twilight-config")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Completion framework:
  {
    "hrsh7th/nvim-cmp",
    config = function()
      pcall(require, "cmp-config")
    end,
  },
  -- Useful completion sources:
  { "hrsh7th/cmp-nvim-lua", dependencies = { "hrsh7th/nvim-cmp" } },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  { "hrsh7th/cmp-buffer",   dependencies = { "hrsh7th/nvim-cmp" } },
  { "hrsh7th/cmp-path",     dependencies = { "hrsh7th/nvim-cmp" } },
  { "hrsh7th/cmp-cmdline",  dependencies = { "hrsh7th/nvim-cmp" } },

  -- LSP completion source:
  { "hrsh7th/cmp-nvim-lsp", dependencies = { "hrsh7th/nvim-cmp" } },
  {
    "phaazon/hop.nvim",
    opts = { keys = "asdfgqwertzxcvb12345" },
    keys = {
      { "<leader>w",  "<cmd>HopWord<CR>",    silent = true },
      { "<leader>l",  "<cmd>HopLine<CR>",    silent = true },
      { "<leader>p",  "<cmd>HopPattern<CR>", silent = true },
      { "<leader>h",  "<cmd>HopChar1<CR>",   silent = true },
      { "<leader>h2", "<cmd>HopChar2<CR>",   silent = true },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      pcall(require, "telescope-config")
    end,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  "nvim-telescope/telescope-hop.nvim",
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sql.nvim" },
  },
  {
    -- https://github.com/nvim-neotest/neotest
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
    },
    opts = {
      adapters = {
        require("neotest-rspec"),
        require("neotest-rust"),
        require("neotest-go"),
      },
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "",
        running = "",
        skipped = "",
        unknown = "",
      },
    },
    keys = {
      { "t<C-a>", "<cmd>lua require('neotest').run.attach()<CR>",                  silent = true },
      { "t<C-d>", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<CR>", silent = true },
      { "t<C-n>", "<cmd>lua require('neotest').run.run()<CR>",                     silent = true },
      { "t<C-t>", "<cmd>lua require('neotest').summary.toggle()<CR>",              silent = true },
      { "t<C-f>", "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>",    silent = true },
      { "t<C-o>", "<cmd>lua require('neotest').output.open()<CR>",                 silent = true },
      { "t<C-l>", "<cmd>lua require('neotest').run.run_last()<CR>",                silent = true },
    }
  },
  "github/copilot.vim",

  -- lsp
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "ruby_ls",
        "rust_analyzer",
        "tsserver",
        "vimls",
        "jsonls",
        "yamlls",
        "terraformls",
        "remark_ls",
        "html",
        "graphql",
        "gopls",
        "dockerls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      pcall(require, "lsp-config")
    end,
  },
  {
    "folke/lsp-colors.nvim",
    opts = {
      Error = "#db4b4b",
      Warning = "#e0af68",
      Information = "#0db9d7",
      Hint = "#10B981",
    },
  },
  {
    'simrat39/inlay-hints.nvim',
    config = function()
      require("inlay-hints").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      pcall(require, "null-ls-config")
    end,
  },
  -- style
  {
    -- https://github.com/hoob3rt/lualine.nvim
    "hoob3rt/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "nightfly",
        section_separators = { "", "" },
        component_separators = { "", "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "vim_lsp" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      pcall(require, "tree-config")
    end,
  },
  -- language specifics
  -- markdown
  {
    "plasticboy/vim-markdown",
    config = function()
      pcall(require, "markdown-config")
    end,
  },
  -- terraform
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_format_on_save = 1
    end,
  },
  -- vader
  { "junegunn/vader.vim", ft = "vader" },
  -- ruby
  { "vim-ruby/vim-ruby",  ft = "ruby" },
  { "tpope/vim-rails",    ft = "ruby" },
  { "tpope/vim-bundler",  ft = "ruby" },
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      pcall(require, "rust-tools-config")
    end,
  },
  -- go
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()'
  },
})
