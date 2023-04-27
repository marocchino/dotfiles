vim.cmd([[
  augroup converter
    autocmd!
    autocmd FileType elixir nnoremap td :call ToggleDo()<CR>
    autocmd FileType elixir nnoremap tw :call ToggleWith()<CR>
    autocmd FileType elixir nnoremap em :call ExpandMulti()<CR>
    autocmd FileType ruby nnoremap td :call ToggleEndless()<CR>
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
]])

vim.keymap.set("n", "<C-]>", "g<C-]>", { silent = false })
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>", { silent = false })
vim.keymap.set("n", "<Leader>[", "<cmd>tabp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>]", "<cmd>tabn<CR>", { silent = true })

-- move windows with hjkl in terminal
vim.keymap.set("t", "<C-W>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "<C-H>", "<C-\\><C-n><C-W>h", { silent = true })
vim.keymap.set("t", "<C-J>", "<C-\\><C-n><C-W>j", { silent = true })
vim.keymap.set("t", "<C-K>", "<C-\\><C-n><C-W>k", { silent = true })
vim.keymap.set("t", "<C-L>", "<C-\\><C-n><C-W>l", { silent = true })

-- vscode
if vim.g.vscode then
  vim.cmd([[
    noremap ; :

    nnoremap <Leader>[ :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
    nnoremap <Leader>] :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
    nnoremap <Leader>b :<C-u>call VSCodeNotify('workbench.view.explorer')<CR>
    nnoremap <Leader>e :<C-u>call VSCodeNotify('workbench.view.extensions')<CR>
    nnoremap <Leader>f :<C-u>call VSCodeNotify('workbench.action.findInFiles')<CR>
    nnoremap <Leader>g :<C-u>call VSCodeNotify('workbench.view.scm')<CR>
    nnoremap <Leader>r :<C-u>call VSCodeNotify('workbench.action.replaceInFiles')<CR>
    nnoremap <Leader>s :<C-u>call VSCodeNotify('extension.dash.specific')<CR>
    nnoremap <Leader>t :<C-u>call VSCodeNotify('workbench.action.terminal.focus')<CR>
    nnoremap [q :<C-u>call VSCodeNotify('editor.action.marker.prev')<CR>
    nnoremap ]q :<C-u>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap [b :<C-u>call VSCodeNotify('workbench.action.navigateBack')<CR>
    nnoremap ]b :<C-u>call VSCodeNotify('workbench.action.navigateForward')<CR>
  ]])
else
  -- LSP config (the mappings used in the default file don't quite work right)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { silent = true })
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { silent = true })
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { silent = true })
  vim.keymap.set(
    "n",
    "<leader>gi",
    vim.lsp.buf.implementation,
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<leader>gt",
    vim.lsp.buf.type_definition,
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<leader>gh",
    vim.lsp.buf.signature_help,
    { silent = true }
  )
  vim.keymap.set("n", "[w", function()
    vim.lsp.diagnostic.goto_prev()
  end, { silent = true })
  vim.keymap.set("n", "]w", function()
    vim.lsp.diagnostic.goto_next()
  end, { silent = true })
end
