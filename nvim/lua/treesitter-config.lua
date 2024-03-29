require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
require("nvim-treesitter.configs").setup({
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  auto_install = true,
  -- ensure_installed = {
  --   "awk",
  --   "bash",
  --   "css",
  --   "dockerfile",
  --   "elixir",
  --   "fish",
  --   "gitcommit",
  --   "go",
  --   "graphql",
  --   "help",
  --   "mermaid",
  --   "html",
  --   "jq",
  --   "json",
  --   "lua",
  --   "query",
  --   "regex",
  --   "ruby",
  --   "rust",
  --   "sql",
  --   "scss",
  --   "toml",
  --   "tsx",
  --   "typescript",
  --   "yaml",
  --   "vim"
  -- },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
