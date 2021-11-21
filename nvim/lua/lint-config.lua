require("lint").linters.rubocop = {
  cmd = "rubocop-daemon-wrapper",
  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  args = { "--format", "json" }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = "stdout", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = function(output)
    local diagnostics = {}
    local decoded = vim.fn.json_decode(output)
    local offenses = decoded.files[1].offenses

    local securities = {
      fatal = "error",
      error = "error",
      warning = "warning",
      convention = "info",
      refactor = "info",
      info = "info",
    }
    for _, off in pairs(offenses or {}) do
      table.insert(diagnostics, {
        range = {
          ["start"] = {
            line = off.location.start_line - 1,
            character = off.location.start_column - 1,
          },
          ["end"] = {
            line = off.location.last_line - 1,
            character = off.location.last_column,
          },
        },
        severity = securities[off.severity],
        message = off.message,
        code = off.cop_name,
      })
    end
    return diagnostics
  end,
}
require("lint").linters.clippy = {
  cmd = "cargo",
  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  append_fname = false,
  args = { "clippy", "--message-format", "short" }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = "both", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = require("lint.parser").from_pattern(
    "^(.+):(%d+):(%d+): (%w+): (.+)$",
    { "file", "line", "start_col", "severity", "message" },
    nil,
    {
      ["source"] = "clippy",
    }
  ),
}

require("lint").linters_by_ft = {
  ruby = { "ruby", "rubocop" },
  rust = { "clippy" },
  sh = { "shellcheck" },
  vim = { "vint" },
  go = { "golangcilint" },
  dockerfile = { "hadolint" },
  gitcommit = { "codeshell" },
  typescript = { "eslint" },
  javascript = { "eslint" },
}

vim.api.nvim_exec(
  [[
augroup nvim_lint
  autocmd!
  autocmd BufWritePost * lua require('lint').try_lint()
augroup END
]],
  false
)

vim.cmd("command! -nargs=? Lint lua require('lint').try_lint(<f-args>)")
