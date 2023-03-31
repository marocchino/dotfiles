vim.cmd("colorscheme tender")

vim.cmd("highlight ColorColumn ctermbg=9")
vim.cmd("highlight NonText guibg=#060606")
vim.cmd("highlight Folded guibg=#0A0A0A guifg=#9090D0")

-- Highlight VCS conflict markers
vim.cmd("match ErrorMsg '^(<|=|>){7}([^=].+)?$'")
-- Highlight japanese spaces as error
vim.cmd("match Error /　/")

vim.cmd([[
  augroup commit_width
    autocmd!
    autocmd Filetype gitcommit setlocal spell textwidth=72
  augroup END
]])

vim.cmd([[
  augroup debugger_highlight
    autocmd!
    autocmd BufEnter *.ex syn match Error "IO.puts\|IO.inspect"
    autocmd BufEnter *.rb syn match Error "binding.pry\|debugger"
    autocmd BufEnter *.{js,coffee} syn match Error "console.log"
  augroup END
]])

vim.cmd([[
  augroup misspelling_highlight
    autocmd!
    autocmd BufEnter *.{md,txt} syn match Error "루비\|루아\|네오빔\|빔"
  augroup END
]])

vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup END
]])
