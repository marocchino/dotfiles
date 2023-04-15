--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.backup = false
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings =
  { "utf-8", "cp949", "cp932", "euc-jp", "shift-jis", "euc-kr" }
vim.opt.hidden = true
vim.opt.history = 50
vim.opt.hlsearch = true
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars =
  { tab = "»·", trail = "·", extends = "»", precedes = "«", nbsp = "%" }
vim.opt.lazyredraw = true
vim.opt.loadplugins = true
vim.opt.magic = true
vim.opt.mouse = "a"
vim.opt.nrformats = { "bin", "octal", "hex" }
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.softtabstop = 2
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "cjk" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.synmaxcol = 800
vim.opt.tabstop = 2
vim.opt.tags = "./tags"
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.ttimeoutlen = 50
vim.opt.wildmenu = true
vim.opt.wildignore:append({
  "*.o",
  "*.out",
  "*.obj",
  ".git",
  "*.rbc",
  "*.rbo",
  "*.class",
  "*.gem",
  "*.pyc",
  "*.pyo",
  "*.exe",
  "*.dll",
  "*.so",
  "*.swp",
  "*.zip",
  "*.tar.gz",
  "*.gif",
  "*.jpg",
  "*.png",
  "*.log",
  "*.DS_Store",
})
vim.opt.writebackup = false
vim.opt.wrap = true
vim.api.nvim_set_option("updatetime", 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

if string.find(vim.env.SHELL, "bin/fish") then
  vim.opt.shell = "/bin/sh"
end

vim.g.VISUAL = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = "$HOMEBREW_PREFIX/bin/python3"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
