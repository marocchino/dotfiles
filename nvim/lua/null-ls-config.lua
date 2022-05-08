require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.mix,
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.formatting.rubocop,
    require("null-ls").builtins.formatting.shellharden,
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.terraform_fmt,
    require("null-ls").builtins.diagnostics.credo,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.hadolint,
    require("null-ls").builtins.diagnostics.rubocop,
    require("null-ls").builtins.diagnostics.shellcheck,
    require("null-ls").builtins.diagnostics.stylelint,
    require("null-ls").builtins.diagnostics.vint,
    require("null-ls").builtins.completion.spell,
  },
  on_attach = function(client)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- vim.lsp.buf.formatting_sync()
          -- increase timeout to 3 seconds
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 3000 })
        end,
      })
    end
  end,
})
