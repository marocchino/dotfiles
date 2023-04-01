require("options")  -- lua/options.lua
require("plugins")  -- lua/plugins.lua
require("keymaps")  -- lua/keymaps.lua
require("augroups") -- lua/augroups.lua

vim.cmd("highlight ColorColumn ctermbg=9")
vim.cmd("highlight NonText guibg=#060606")
vim.cmd("highlight Folded guibg=#0A0A0A guifg=#9090D0")

-- Highlight VCS conflict markers
vim.cmd("match ErrorMsg '^(<|=|>){7}([^=].+)?$'")
-- Highlight japanese spaces as error
vim.cmd("match Error /　/")

vim.cmd("syntax enable")
vim.cmd("syntax sync fromstart")
