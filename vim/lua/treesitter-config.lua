require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'elixir',
    'fish',
    'go',
    'graphql',
    'html',
    'json',
    'lua',
    'regex',
    'ruby',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['iF'] = '(function_definition) @function',
      },
    },
  },
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = { 'javascript', 'typescript.tsx' }
