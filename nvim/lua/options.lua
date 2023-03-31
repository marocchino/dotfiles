vim.opt.completeopt:append("preview")
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "cp949", "cp932", "euc-jp", "shift-jis", "euc-kr" }
vim.opt.hidden = true
vim.opt.history = 50
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", extends = "»", precedes = "«", nbsp = "%" }
vim.opt.lazyredraw = true
vim.opt.loadplugins = true
vim.opt.magic = true
vim.opt.nrformats = { "bin", "octal", "hex" }
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.spelllang = { "en_us", "cjk" }
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.softtabstop = 2
vim.opt.synmaxcol = 800
vim.opt.tabstop = 2
vim.opt.tags = "./tags"
vim.opt.textwidth = 80
vim.opt.ttimeoutlen = 50
vim.opt.wildmenu = true
vim.opt.wrap = true

if string.find(vim.env.SHELL, "bin/fish") then
  vim.opt.shell = "/bin/sh"
end

vim.opt.mouse = "a"

if vim.fn.has("gui_running") == 1 then
  vim.cmd("set guioptions-=r")
  vim.cmd("set macligatures")
  vim.cmd("set guifont=Fira\\ Code\\ Retina:h12")
end

vim.g.VISUAL = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = "$HOMEBREW_PREFIX/bin/python3"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.wildignore:append({
  "*.o", "*.out", "*.obj", ".git", "*.rbc", "*.rbo", "*.class", "*.gem",
  "*.pyc", "*.pyo", "*.exe", "*.dll", "*.so", "*.swp", "*.zip", "*.tar.gz",
  "*.gif", "*.jpg", "*.png", "*.log", "*.DS_Store",
})
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
