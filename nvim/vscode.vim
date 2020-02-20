command A call VSCodeNotify('alternate.alternateFile')<CR>
command AV call VSCodeNotify('alternate.alternateFileInSplit')<CR>
command AC call VSCodeNotify('alternate.createAlternateFile')<CR>
command AVC call VSCodeNotify('alternate.createAlternateFileInSplit')<CR>
command Snippet call VSCodeNotify('workbench.action.openSnippets')<CR>
noremap ; :

nnoremap S i<cr><esc><right>
nnoremap ,. :<C-u>call VSCodeNotify('editor.action.commentLine')<CR>
nnoremap ., :<C-u>call VSCodeNotify('editor.action.commentLine')<CR>
nnoremap <Leader>s :<C-u>call VSCodeNotify('extension.dash.specific')<CR>
nnoremap <Leader>d :<C-u>call VSCodeNotify('extension.macDictionary.lookup')<CR>
nnoremap <Leader>f :<C-u>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap <Leader>b :<C-u>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <Leader>g :<C-u>call VSCodeNotify('workbench.view.scm')<CR>
nnoremap <Leader>t :<C-u>call VSCodeNotify('workbench.action.terminal.focus')<CR>
nnoremap <Leader>g :<C-u>call VSCodeNotify('workbench.view.scm')<CR>
nnoremap <Leader>[ :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <Leader>] :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
nnoremap [q :<C-u>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap ]q :<C-u>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap [b :<C-u>call VSCodeNotify('workbench.action.navigateBack')<CR>
nnoremap ]b :<C-u>call VSCodeNotify('workbench.action.navigateForward')<CR>
