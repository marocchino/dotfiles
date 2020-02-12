command A call VSCodeNotify('alternate.alternateFile')<CR>
command AV call VSCodeNotify('alternate.alternateFileInSplit')<CR>
command AC call VSCodeNotify('alternate.createAlternateFile')<CR>
command AVC call VSCodeNotify('alternate.createAlternateFileInSplit')<CR>
command Snippet call VSCodeNotify('workbench.action.openSnippets')<CR>
noremap ; :

nnoremap S i<cr><esc><right>
nnoremap ,. :<C-u>call VSCodeNotify('editor.action.commentLine')<CR>
nnoremap ., :<C-u>call VSCodeNotify('editor.action.commentLine')<CR>

