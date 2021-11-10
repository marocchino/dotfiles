augroup converter
  autocmd!
  autocmd FileType elixir nnoremap ec :call PipeConvert()<CR>
  autocmd FileType elixir nnoremap er :call PipeRevert()<CR>
  autocmd FileType elixir nnoremap td :call ToggleDo()<CR>
  autocmd FileType elixir nnoremap tw :call ToggleWith()<CR>
  autocmd FileType elixir nnoremap em :call ExpandMulti()<CR>
  autocmd FileType ruby nnoremap td :call ToggleEndless()<CR>
augroup END

" move windows with hjkl
" nnoremap :ter :split|terminal
tnoremap <C-W> <C-\><C-n>
tnoremap <silent> <C-H> <C-\><C-n>:wincmd h<CR>
tnoremap <silent> <C-J> <C-\><C-n>:wincmd j<CR>
tnoremap <silent> <C-K> <C-\><C-n>:wincmd k<CR>
tnoremap <silent> <C-L> <C-\><C-n>:wincmd l<CR>
nnoremap <C-]> g<C-]>
nnoremap <esc><esc> :nohlsearch<CR>
nnoremap <silent><leader>[ :tabp<CR>
nnoremap <silent><leader>] :tabn<CR>
nnoremap <silent><leader>f :Rg<Space>
nnoremap <silent><leader>r :call VisualFindAndReplace()<CR>
xnoremap <silent><leader>r :call VisualFindAndReplaceWithSelection()<CR>
nnoremap <silent><leader>e :NvimTreeToggle<CR>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> <Plug>(ultest-run-nearest)
nmap <silent> t<C-f> <Plug>(ultest-run-file)
nmap <silent> t<C-j> <Plug>(ultest-summary-jump)
nmap <silent> t<C-t> <Plug>(ultest-summary-toggle)
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> [t <Plug>(ultest-next-fail)
nmap <silent> ]t <Plug>(ultest-prev-fail)

augroup ruby_fail_ultests
  autocmd!
  autocmd FileType ruby nmap <silent> t<C-n> :TestNearest<CR>
  autocmd FileType ruby nmap <silent> t<C-f> :TestFile<CR>
  autocmd FileType ruby nmap <silent> t<C-f> :TestFile<CR>
augroup END


" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Format<CR>
nnoremap <silent><leader>t <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent><leader>w :HopWord<CR>
nnoremap <silent><leader>l :HopLine<CR>
nnoremap <silent><leader>p :HopPattern<CR>
nnoremap <silent><leader>h :HopChar1<CR>
nnoremap <silent><leader>h2 :HopChar2<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nmap <leader><leader> <c-^>
nmap <silent> [w <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <silent> ]w <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent><leader>ff <cmd>Telescope frecency<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>b <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent><leader>fs <cmd>Telescope ultisnips<cr>
nnoremap <silent><leader>fc <cmd>Telescope neoclip<cr>

noremap Q <Nop>
noremap q: :q
noremap ; :
noremap bd :wall \| bd<cr>
nnoremap - :Switch<cr>
" Use command d on top of a word to look it up in Dictionary.app
nnoremap <silent> <D-d> :silent !open dict://<cword><CR>
nnoremap <silent> <C-d> :Dash<CR>
nnoremap S i<cr><esc><right>
vmap <Enter> <Plug>(EasyAlign)
tnoremap <silent> <C-[> <C-\><C-n>

" vim-commentary
nmap ,. gcc
nmap ., gcc
xmap ,. gc
xmap ., gc
omap ,. gc
omap ., gc