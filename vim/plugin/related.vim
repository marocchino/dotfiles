" Open/Create related spec/file
function! s:CreateRelated()
  let related = s:GetRelatedFile(expand('%'))
  call s:Open(related)
endfunction

" Return the related filename
function! s:GetRelatedFile(file)
  if match(a:file, '_spec\.rb$') != -1
    if match(a:file, '^spec/lib/') != -1
      return substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/', '', '')
    else
      return substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/', 'app/', '')
    endif
  else
    if match(a:file, '^lib/') != -1
      return substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^lib/', 'spec/lib/', '')
    else
      return substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^app/', 'spec/', '')
    endif
  endif
endfunction

" Open the related file in a vsplit
function! s:Open(file)
  exec('vsplit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()
