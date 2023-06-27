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
  -- discord status
  "andweeb/presence.nvim",
  -- optional configuration
  {
    "AndrewRadev/switch.vim",
    keys = {
      { "-", "<Cmd>Switch<CR>", silent = true },
    },
    submodules = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = not vim.g.vscode,
    keys = {
      { "<C-h>", "<Cmd><C-U>TmuxNavigateLeft<CR>", silent = true },
      { "<C-j>", "<Cmd><C-U>TmuxNavigateDown<CR>", silent = true },
      { "<C-k>", "<Cmd><C-U>TmuxNavigateUp<CR>", silent = true },
      { "<C-l>", "<Cmd><C-U>TmuxNavigateRight<CR>", silent = true },
    },
  },
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
      vim.g.deepl_api_auth_key = os.getenv("DEEPL_API_AUTH_KEY")
      require("translate").setup({
        default = {
          command = "deepl_free",
          output = "insert",
        },
      })
    end,
  },
  "honza/vim-snippets",
  "jgdavey/vim-blockle",
  "mattn/emmet-vim",
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {
      max_time = 2000,
      max_count = 10,
      allow_different_key = true,
      disable_mouse = false,
    },
  },
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
  {
    "tpope/vim-fugitive",
    lazy = false,
    enabled = not vim.g.vscode,
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", silent = true },
      { "<leader>gaf", "<cmd>Git add %<CR>", silent = true },
      { "<leader>grs", "<cmd>Git restore --staged %<CR>", silent = true },
    },
  },
  "tpope/vim-projectionist",
  {
    "tpope/vim-ragtag",
    config = function()
      vim.g.ragtag_global_maps = 1
    end,
  },
  {
    "marocchino/acommit.nvim",
    dev = true,
    enabled = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gc", "<cmd>Gacommit<CR>", silent = true },
    },
  },
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "wakatime/vim-wakatime",
  -- mac
  "MarcWeber/vim-addon-mw-utils",

  -- color
  {
    "rebelot/kanagawa.nvim",
    enabled = not vim.g.vscode,
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
    opts = {},
  },

  -- chatgpt
  {
    "Bryley/neoai.nvim",
    enabled = not vim.g.vscode,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- ignore default shortcuts
      shortcuts = {},
    },
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = not vim.g.vscode,
    build = ":TSUpdate",
    config = function()
      pcall(require, "treesitter-config")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = not vim.g.vscode,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "kana/vim-textobj-user",
    },
  },
  {
    "nvim-treesitter/playground",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "romgrk/nvim-treesitter-context",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { enable = true },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Completion framework:
  {
    "hrsh7th/nvim-cmp",
    enabled = not vim.g.vscode,
    config = function()
      pcall(require, "cmp-config")
    end,
  },
  -- Useful completion sources:
  {
    "hrsh7th/cmp-nvim-lua",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-vsnip",
    enabled = not vim.g.vscode,
  },
  {
    "hrsh7th/vim-vsnip",
    enabled = not vim.g.vscode,
  },
  {
    "hrsh7th/cmp-buffer",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-path",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-cmdline",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },

  -- LSP completion source:
  {
    "hrsh7th/cmp-nvim-lsp",
    enabled = not vim.g.vscode,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "phaazon/hop.nvim",
    opts = { keys = "asdfgqwertzxcvb12345" },
    keys = {
      { "<leader>w", "<cmd>HopWord<CR>", silent = true },
      { "<leader>l", "<cmd>HopLine<CR>", silent = true },
      { "<leader>p", "<cmd>HopPattern<CR>", silent = true },
      { "<leader>h", "<cmd>HopChar1<CR>", silent = true },
      { "<leader>h2", "<cmd>HopChar2<CR>", silent = true },
    },
  },
  {
    "lewis6991/hover.nvim",
    enabled = not vim.g.vscode,
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require("hover.providers.gh")
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require("hover.providers.man")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = nil,
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
      })

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set(
        "n",
        "gK",
        require("hover").hover_select,
        { desc = "hover.nvim (select)" }
      )
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })
          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })
          -- Actions
          map("n", "<leader>ga", gs.stage_hunk)
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end)
          map("n", "<leader>gd", gs.diffthis)
        end,
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      pcall(require, "telescope-config")
    end,
    keys = {
      {
        "<leader>f",
        "<cmd>Telescope builtin<cr>",
        silent = true,
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        silent = true,
      },
      {
        "<leader>fd",
        "<cmd>Telescope lsp_definitions<cr>",
        silent = true,
      },
      {
        "<leader>ff",
        "<cmd>Telescope frecency<cr>",
        silent = true,
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        silent = true,
      },
      {
        "<leader>fgb",
        "<cmd>Telescope git_branches<cr>",
        silent = true,
      },
      {
        "<leader>fgf",
        "<cmd>Telescope git_files<cr>",
        silent = true,
      },
      {
        "<leader>fgs",
        "<cmd>Telescope git_status<cr>",
        silent = true,
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        silent = true,
      },
      {
        "<leader>fi",
        "<cmd>Telescope lsp_implementations<cr>",
        silent = true,
      },
      {
        "<leader>fn",
        "<cmd>lua require'telescope.builtin'.symbols{ sources = {'nerd'} }<CR>",
        silent = true,
      },
      {
        "<leader>fr",
        "<cmd>Telescope registers<cr>",
        silent = true,
      },
      {
        "<leader>ft",
        "<cmd>Telescope treesitter<cr>",
        silent = true,
      },
    },
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>fgm",
        "<cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>",
        silent = true,
      },
      {
        "<leader>fem",
        "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>",
        silent = true,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "AckslD/nvim-neoclip.lua",
    enabled = not vim.g.vscode,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("neoclip").setup()
    end,
    keys = {
      { "<leader>fc", "<cmd>Telescope neoclip<cr>", silent = true },
    },
  },
  "nvim-telescope/telescope-hop.nvim",
  {
    "nvim-telescope/telescope-frecency.nvim",
    enabled = not vim.g.vscode,
    dependencies = { "tami5/sql.nvim" },
  },
  {
    -- https://github.com/nvim-neotest/neotest
    "nvim-neotest/neotest",
    enabled = not vim.g.vscode,
    dependencies = {
      "haydenmeade/neotest-jest",
      "jfpedroza/neotest-elixir",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-plenary",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      -- "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir"),
          require("neotest-go"),
          require("neotest-jest")({
            jestCommand = "yarn test --",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-plenary"),
          require("neotest-rspec"),
          -- require("neotest-rust"),
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
      })
    end,
    keys = {
      {
        "t<C-a>",
        "<cmd>lua require('neotest').run.attach()<CR>",
        silent = true,
      },
      {
        "t<C-d>",
        "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<CR>",
        silent = true,
      },
      {
        "t<C-n>",
        "<cmd>lua require('neotest').run.run()<CR>",
        silent = true,
      },
      {
        "t<C-t>",
        "<cmd>lua require('neotest').summary.toggle()<CR>",
        silent = true,
      },
      {
        "t<C-f>",
        "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>",
        silent = true,
      },
      {
        "t<C-o>",
        "<cmd>lua require('neotest').output.open()<CR>",
        silent = true,
      },
      {
        "t<C-l>",
        "<cmd>lua require('neotest').run.run_last()<CR>",
        silent = true,
      },
    },
  },
  { "github/copilot.vim", enabled = not vim.g.vscode },

  -- lsp
  {
    "williamboman/mason.nvim",
    enabled = not vim.g.vscode,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = not vim.g.vscode,
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
    enabled = not vim.g.vscode,
    config = function()
      pcall(require, "lsp-config")
    end,
  },
  {
    "folke/lsp-colors.nvim",
    enabled = not vim.g.vscode,
    opts = {
      Error = "#db4b4b",
      Warning = "#e0af68",
      Information = "#0db9d7",
      Hint = "#10B981",
    },
  },
  {
    "simrat39/inlay-hints.nvim",
    enabled = not vim.g.vscode,
    config = function()
      require("inlay-hints").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = not vim.g.vscode,
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = false,
        sources = {
          -- formatting
          null_ls.builtins.formatting.mix,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.rustfmt,
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting/rubocop.lua
          null_ls.builtins.formatting.rubocop.with({
            args = {
              "--autocorrect-all",
              "--force-exclusion",
              "-f",
              "quiet",
              "--stderr",
              "--stdin",
              "$FILENAME",
            },
          }),
          null_ls.builtins.formatting.shellharden,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.formatting.fixjson,

          -- diagnostics
          null_ls.builtins.diagnostics.actionlint,
          null_ls.builtins.diagnostics.codespell,
          -- null_ls.builtins.diagnostics.credo,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.erb_lint,
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.diagnostics.hadolint,
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/rubocop.lua
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.diagnostics.vint,
          null_ls.builtins.diagnostics.yamllint,
        },
      })
    end,
  },
  -- style
  {
    -- https://github.com/hoob3rt/lualine.nvim
    "hoob3rt/lualine.nvim",
    enabled = not vim.g.vscode,
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
            path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
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
    enabled = not vim.g.vscode,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
      },
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", silent = true },
    },
  },
  -- language specifics
  -- markdown
  {
    "plasticboy/vim-markdown",
    config = function()
      vim.g.vim_markdown_fenced_languages = {
        "c++=cpp",
        "viml=vim",
        "bash=sh",
        "ini=dosini",
        "ruby=rb",
        "python=py",
        "markdown=md",
        "javascript=js",
        "elixir=ex",
      }
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_new_list_item_indent = 2
    end,
  },
  -- slim
  { "slim-template/vim-slim" },
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
  { "vim-ruby/vim-ruby", ft = "ruby" },
  { "tpope/vim-rails", ft = "ruby" },
  { "tpope/vim-bundler", ft = "ruby" },
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set(
              "n",
              "<C-space>",
              rt.hover_actions.hover_actions,
              { buffer = bufnr }
            )
            -- Code action groups
            vim.keymap.set(
              "n",
              "<Leader>a",
              rt.code_action_group.code_action_group,
              { buffer = bufnr }
            )
          end,
        },
      })
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
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}, {
  dev = {
    path = "~/Documents",
    patterns = { "*.nvim" },
  },
})
