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
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      augroup LspFormatting
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end
  end,
})
-- increase timeout to 3 seconds
vim.lsp.buf.formatting_sync(nil, 3000)
