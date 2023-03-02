local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.mix,
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.gofmt,
    require("null-ls").builtins.formatting.rustfmt,
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting/rubocop.lua
    require("null-ls").builtins.formatting.rubocop.with({
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
    require("null-ls").builtins.formatting.shellharden,
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.terraform_fmt,
    require("null-ls").builtins.formatting.fixjson,
    require("null-ls").builtins.diagnostics.actionlint,
    require("null-ls").builtins.diagnostics.codespell,
    require("null-ls").builtins.diagnostics.credo,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.erb_lint,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.gospel,
    require("null-ls").builtins.diagnostics.hadolint,
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/rubocop.lua
    require("null-ls").builtins.diagnostics.rubocop,
    require("null-ls").builtins.diagnostics.shellcheck,
    require("null-ls").builtins.diagnostics.stylelint,
    require("null-ls").builtins.diagnostics.vint,
    require("null-ls").builtins.diagnostics.yamllint,
  },
  on_attach = function(client)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- increase timeout to 3 seconds
          -- vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 3000 })
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
