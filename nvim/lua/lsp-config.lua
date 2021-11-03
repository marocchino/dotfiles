local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require'completion'.on_attach(client, bufnr)

  if client.name ~= "diagnosticls" then
    client.resolved_capabilities.document_formatting = false
  end

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '' -- TypeParameter
  }
end

local function setup_servers()
  require('lspinstall').setup()
  local servers = require('lspinstall').installed_servers()
  for _, server in pairs(servers) do
    nvim_lsp[server].setup {on_attach = on_attach}
  end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

setup_servers()

nvim_lsp.lua.setup {
  on_attach = on_attach,
  settings = {Lua = {diagnostics = {globals = {'vim', 'use'}}}}
}
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {
    'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact',
    'css', 'less', 'scss', 'html', 'yaml', 'markdown', 'ruby', 'elixir',
    'graphql', 'go', 'rust', 'lua', 'sh', 'viml'
  },
  init_options = {
    linters = {
      -- rubocop = {
      --   command = 'bundle',
      --   debounce = 100,
      --   args = {
      --     'exec', 'rubocop', '--format=json', '--force-exclusion', '--stdin',
      --     '%filepath'
      --   },
      --   parseJson = {
      --     errorsRoot = 'files[0].offenses',
      --     line = 'location.start_line',
      --     endLine = 'location.last_line',
      --     column = 'location.start_column',
      --     endColumn = 'location.end_column',
      --     message = '[rubocop] [${cop_name}] ${message}',
      --     security = 'severity'
      --   },
      --   securities = {
      --     fatal = 'error',
      --     error = 'error',
      --     warning = 'warning',
      --     convention = 'info',
      --     refactor = 'info',
      --     info = 'info'
      --   },
      --   rootPatterns = {'.git'}
      -- },
      shellcheck = {
        command = 'shellcheck',
        debounce = 100,
        args = {'--format', 'json', '-'},
        sourceName = 'shellcheck',
        parseJson = {
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${code}]',
          security = 'level'
        },
        securities = {
          error = 'error',
          warning = 'warning',
          info = 'info',
          style = 'hint'
        }
      },
      vint = {
        command = 'vint',
        debounce = 100,
        args = {'--enable-neovim', '-'},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'vint',
        formatLines = 1,
        formatPattern = {
          '[^:]+:(\\d+):(\\d+):\\s*(.*)(\\r|\\n)*$',
          {line = 1, column = 2, message = 3}
        }
      },
      hadolint = {
        command = 'hadolint',
        sourceName = 'hadolint',
        args = {'-f', 'json', '-'},
        rootPatterns = {'.hadolint.yaml'},
        parseJson = {
          line = 'line',
          column = 'column',
          security = 'level',
          message = '${message} [${code}]'
        },
        securities = {
          error = 'error',
          warning = 'warning',
          info = 'info',
          style = 'hint'
        }
      },
      eslint = {
        command = 'eslint_d',
        rootPatterns = {'.git'},
        debounce = 100,
        args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {[2] = 'error', [1] = 'warning'}
      }
    },
    filetypes = {
      -- ruby = 'rubocop',
      dockerfile = 'hadolint',
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      sh = 'shellcheck',
      vim = 'vint'
    },
    formatters = {
      -- eslint_d = {
      --   command = 'eslint_d',
      --   args = {'--stdin', '--stdin-filename', '%file', '--fix-to-stdout'},
      --   rootPatterns = {'.git'}
      -- },
      lua_format = {
        command = 'lua-format',
        args = {'%file'},
        rootPatterns = {'.lua-format'}
      },
      mix_format = {
        command = 'mix',
        args = {'format', '-'},
        rootPatterns = {'.formatter.exs'}
      },
      prettier = {
        command = 'prettier',
        args = {'--stdin', '--stdin-filepath', '%filepath'},
        rootPatterns = {'.prettierrc', '.prettierrc.json'}
      }
    },
    formatFiletypes = {
      -- luarocks install --server=https://luarocks.org/dev luaformatter
      lua = 'lua_format',
      elixir = 'mix_format',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      css = 'prettier',
      less = 'prettier',
      yaml = 'prettier',
      vue = 'prettier',
      html = 'prettier',
      typescriptreact = 'prettier',
      typescript = 'prettier',
      markdown = 'prettier'
    }
  }
}
