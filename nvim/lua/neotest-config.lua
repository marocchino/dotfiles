-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
local ok, neotest = pcall(require, "neotest")
if not ok then
  return
end
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
          diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)
neotest.setup({
  adapters = {
    require("neotest-rspec"),
    require("neotest-rust"),
    require("neotest-go"),
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "",
    running = "",
    skipped = "",
    unknown = "",
  },
})

-- these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
vim.keymap.set('n', 't<C-a>', neotest.run.attach, { silent = true })
vim.keymap.set('n', 't<C-d>', function()
  neotest.run.run({ strategy = 'dap' })
end, { silent = true })
vim.keymap.set('n', 't<C-n>', neotest.run.run, { silent = true })
vim.keymap.set('n', 't<C-t>', neotest.summary.toggle, { silent = true })
vim.keymap.set('n', 't<C-f>', function()
  neotest.run.run(vim.fn.expand "%")
end, { silent = true })
vim.keymap.set('n', 't<C-o>', neotest.output.open, { silent = true })
vim.keymap.set('n', 't<C-l>', neotest.run.run_last, { silent = true })
