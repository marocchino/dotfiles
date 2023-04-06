vim.cmd([[
  augroup converter
    autocmd!
    autocmd FileType elixir nnoremap td :call ToggleDo()<CR>
    autocmd FileType elixir nnoremap tw :call ToggleWith()<CR>
    autocmd FileType elixir nnoremap em :call ExpandMulti()<CR>
    autocmd FileType ruby nnoremap td :call ToggleEndless()<CR>
  augroup END

  augroup commit_gitmoji
    autocmd!
    autocmd Filetype gitcommit,markdown,json,csv,text nnoremap <silent><leader>g <cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>
  augroup END

  noremap Q <Nop>
  noremap q: :q
  vmap <Enter> <Plug>(EasyAlign)
  tnoremap <silent> <C-[> <C-\><C-n>
  nmap <leader><leader> <c-^>

  " vim-commentary
  nmap ,. gcc
  nmap ., gcc
  xmap ,. gc
  xmap ., gc
  omap ,. gc
  omap ., c

  " telescope
  nnoremap <silent><leader>f <cmd>Telescope builtin<cr>
  nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
  nnoremap <silent><leader>fc <cmd>Telescope neoclip<cr>
  nnoremap <silent><leader>fd <cmd>Telescope lsp_definitions<cr>
  nnoremap <silent><leader>fe <cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>
  nnoremap <silent><leader>ff <cmd>Telescope frecency<cr>
  nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <silent><leader>fgb <cmd>Telescope git_branches<cr>
  nnoremap <silent><leader>fgf <cmd>Telescope git_files<cr>
  nnoremap <silent><leader>fgs <cmd>Telescope git_status<cr>
  nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <silent><leader>fi <cmd>Telescope lsp_implementations<cr>
  nnoremap <silent><leader>fn <cmd>lua require'telescope.builtin'.symbols{ sources = {'nerd'} }<CR>
  nnoremap <silent><leader>fr <cmd>Telescope registers<cr>
  nnoremap <silent><leader>ft <cmd>Telescope treesitter<cr>
]])

vim.keymap.set("n", "<C-]>", "g<C-]>", { silent = false })
vim.keymap.set("n", "<esc><esc>", ":nohlsearch<CR>", { silent = false })
vim.keymap.set("n", "<Leader>[", "<cmd>tabp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>]", "<cmd>tabn<CR>", { silent = true })
vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true })

-- move windows with hjkl
vim.keymap.set("n", "<C-H>", "<C-W>h", { silent = true })
vim.keymap.set("n", "<C-J>", "<C-W>j", { silent = true })
vim.keymap.set("n", "<C-K>", "<C-W>k", { silent = true })
vim.keymap.set("n", "<C-L>", "<C-W>l", { silent = true })
vim.keymap.set("t", "<C-W>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "<C-H>", "<C-\\><C-n><C-W>h", { silent = true })
vim.keymap.set("t", "<C-J>", "<C-\\><C-n><C-W>j", { silent = true })
vim.keymap.set("t", "<C-K>", "<C-\\><C-n><C-W>k", { silent = true })
vim.keymap.set("t", "<C-L>", "<C-\\><C-n><C-W>l", { silent = true })

-- LSP config (the mappings used in the default file don't quite work right)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { silent = true })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { silent = true })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { silent = true })
vim.keymap.set(
  "n",
  "<leader>gt",
  vim.lsp.buf.type_definition,
  { silent = true }
)
vim.keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, { silent = true })
vim.keymap.set("n", "[w", function()
  vim.lsp.diagnostic.goto_prev()
end, { silent = true })
vim.keymap.set("n", "]w", function()
  vim.lsp.diagnostic.goto_next()
end, { silent = true })
