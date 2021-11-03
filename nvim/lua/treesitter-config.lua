require'nvim-treesitter.configs'.setup {
  highlight = {enable = true, disable = {}},
  indent = {enable = false, disable = {}},
  context_commentstring = {enable = true, enable_autocmd = false},
  ensure_installed = {
    'bash', 'css', 'dockerfile', 'elixir', 'fish', 'go', 'graphql', 'html',
    'json', 'lua', 'query', 'regex', 'ruby', 'rust', 'scss', 'toml', 'tsx',
    'typescript', 'yaml'
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
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner'
      }
    }
  }
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = {'javascript', 'typescript.tsx'}
