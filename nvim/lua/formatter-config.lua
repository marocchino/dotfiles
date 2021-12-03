local formatters = {
  terraform = function()
    return {
      exe = "terraform",
      args = { "fmt", "-" },
      stdin = true,
    }
  end,
  prettier = function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
      },
      stdin = true,
    }
  end,
  mixformat = function()
    return {
      exe = "mix",
      args = { "format", "-" },
      stdin = true,
    }
  end,
  clippy = function()
    return {
      exe = "cargo",
      args = { "clippy", "--fix" },
      stdin = false,
      ignore_exitcode = true,
    }
  end,
  cargo = function()
    return {
      exe = "cargo",
      args = { "fix" },
      stdin = false,
      ignore_exitcode = true,
    }
  end,
  rubocop = function()
    return {
      exe = "rubocop-daemon-wrapper",
      args = {
        "--auto-correct",
        "--stdin",
        "%:p",
        "2>/dev/null",
        "|",
        "awk 'f; /^====================$/{f=1}'",
      },
      stdin = true,
    }
  end,
  -- luarocks install --server=https://luarocks.org/dev luaformatter
  stylua = function()
    return {
      exe = "stylua",
      args = { "-" },
      stdin = true,
    }
  end,
}

require("formatter").setup({
  filetype = {
    terraform = { formatters.terraform },
    ruby = { formatters.rubocop },
    rust = { formatters.clippy, formatters.cargo },
    lua = { formatters.stylua },
    elixir = { formatters.mixformat },
    javascript = { formatters.prettier },
    javascriptreact = { formatters.prettier },
    json = { formatters.prettier },
    scss = { formatters.prettier },
    css = { formatters.prettier },
    less = { formatters.prettier },
    yaml = { formatters.prettier },
    vue = { formatters.prettier },
    html = { formatters.prettier },
    typescriptreact = { formatters.prettier },
    typescript = { formatters.prettier },
    markdown = { formatters.prettier },
  },
})

vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
    autocmd!
    autocmd FileType terraform,ruby,lua,elixir,javascript,javascriptreact,json,scss,css,less,yaml,vue,html,typescript,typescriptreact,markdown
    \ autocmd BufWritePost * FormatWrite
  augroup END
  ]],
  true
)
