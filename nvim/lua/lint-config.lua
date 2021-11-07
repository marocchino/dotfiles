require("lint").linters.rubocop = {
  cmd = "rubocop-daemon-wrapper",
  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  args = { "--format", "json" }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = function(output)
    local diagnostics = {}
    local decoded = vim.fn.json_decode(output)
    local offences = decoded.files[1].offences

    local securities = {
      fatal = "error",
      error = "error",
      warning = "warning",
      convention = "info",
      refactor = "info",
      info = "info",
    }
    for _, off in pairs(offences or {}) do
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

require("lint").linters_by_ft = {
  ruby = { "ruby", "rubocop" },
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
