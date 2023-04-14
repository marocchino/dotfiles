vim.api.nvim_create_augroup("auto_save", { clear = true })
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  group = "auto_save",
  command = "silent! update",
})

vim.api.nvim_create_augroup("commit_width", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "gitcommit",
  group = "commit_width",
  command = "setlocal spell textwidth=72",
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "gitcommit",
  group = "commit_width",
  command = "set colorcolumn=72",
})

vim.api.nvim_create_augroup("disable_copilot_in_exercism", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*/Exercism/*",
  group = "disable_copilot_in_exercism",
  command = "Copilot disable",
})

vim.api.nvim_create_augroup("reload_vim", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.vim",
  group = "reload_vim",
  command = "source %",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  group = "reload_vim",
  command = "luafile %",
})

vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = "highlight_yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
  end,
})

vim.api.nvim_create_augroup("highlight_debugger", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.ex",
  group = "highlight_debugger",
  command = 'syn match Error "IO.puts\\|IO.inspect"',
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.rb",
  group = "highlight_debugger",
  command = 'syn match Error "binding.pry\\|debugger"',
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.js", "*.ts", "*.tsx" },
  group = "highlight_debugger",
  command = 'syn match Error "colsole.log"',
})

vim.api.nvim_create_augroup("highlight_misspell", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.txt" },
  group = "highlight_misspell",
  command = 'syn match Error "루비\\|루아\\|네오빔\\|빔\\|메소드"',
})
