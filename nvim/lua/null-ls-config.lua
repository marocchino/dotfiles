local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.mix,
    require("null-ls").builtins.formatting.prettier,
    -- require("null-ls").builtins.formatting.rubocop.with({
    --   args = {
    --     "--auto-correct-all",
    --     "--force-exclusion",
    --     "-f",
    --     "quiet",
    --     -- "--server",
    --     "--stderr",
    --     "--stdin",
    --     "$FILENAME",
    --   },
    -- }),
    require("null-ls").builtins.formatting.shellharden,
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.terraform_fmt,
    require("null-ls").builtins.diagnostics.actionlint,
    require("null-ls").builtins.diagnostics.codespell,
    require("null-ls").builtins.diagnostics.credo,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.erb_lint,
    require("null-ls").builtins.diagnostics.golangci_lint,
    require("null-ls").builtins.diagnostics.hadolint,
    require("null-ls").builtins.diagnostics.rubocop.with({
      args = {
        "-f",
        "json",
        "--server",
        "--force-exclusion",
        "--stdin",
        "$FILENAME",
      },
    }),
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
