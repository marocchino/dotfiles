" https://github.com/gibfahn/dot/commit/6b7f23ab4d127fbadfe9234716b6df8347d1521a
" Open path or URL using system open command.
function! Browse(pathOrUrl)
  " This doesn't work with /usr/bin/vim on macOS (doesn't identify as macOS).
  if has('mac')| let openCmd = 'open'| else| let openCmd = 'xdg-open'| endif
    silent execute '! ' . openCmd . ' ' . shellescape(a:pathOrUrl, 1)| " Escape Path or URL and pass as arg to open command.
    echo openCmd . ' ' shellescape(a:pathOrUrl, 1)| " Echo what we ran so it's visible.
endfunction
command! -nargs=1 Browse call Browse(<q-args>)|

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction
