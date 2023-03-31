require("options") -- lua/options.lua
require("colors")  -- lua/colors.lua
require("plugins") -- lua/plugins.lua
require("keymaps") -- lua/keymaps.lua

vim.cmd([[
  augroup commit_width
    autocmd!
    autocmd Filetype gitcommit setlocal spell textwidth=72
  augroup END
]])

vim.cmd([[
  augroup disable_copilot_in_exercism
    autocmd!
    autocmd BufEnter */exercism/* Copilot disable
  augroup END
]])

vim.cmd([[
  augroup auto_save
    autocmd!
    autocmd BufLeave,FocusLost * silent! update
  augroup END
]])

vim.cmd([[
  augroup reload_vim_config
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END
]])

vim.cmd([[
  augroup reload_vim
    autocmd!
    autocmd BufWritePost *.vim source %
    autocmd BufWritePost *.lua luafile %
  augroup END
]])

vim.cmd("syntax enable")
vim.cmd("syntax sync fromstart")
