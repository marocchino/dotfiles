local function on_attach(client)
  print('Attached to ' .. client.name)
end

-- see: https://github.com/creativenull/diagnosticls-configs-nvim/blob/main/supported-linters-and-formatters.md
local dlsconfig = require 'diagnosticls-configs'
local rubocop = require 'diagnosticls-configs.linters.rubocop'

dlsconfig.init {
  on_attach = on_attach,
  default_config = true,
  format = true
}

dlsconfig.setup {
  ['ruby'] = {
    linter = rubocop
  }
}
