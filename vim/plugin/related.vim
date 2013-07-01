" Open/Create related spec/file
function! s:CreateRelated()
  let related = GetRelatedFile(expand('%'))
  call s:Open(related)
endfunction

" Return the related filename
" TODO make scope function
function! GetRelatedFile(file)
  if match(a:file, '_spec\.rb$') != -1
    return substitute(substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/lib/', 'lib/', ''), '^spec/', 'app/', '')
  else
    return substitute(substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^lib/', 'spec/lib/', ''), '^app/', 'spec/', '')
  endif
endfunction

" Open the related file in a vsplit
function! s:Open(file)
  exec('vsplit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()
