function! ExpandMulti()
  mark `
  let line=getline('.')
  if line !~ '\.{'
  elseif line !~ '}'
    let prefix = substitute(line, "\.{.*", "", "")
    let end = search('}')
    normal ``
    let matched = join(getline('.', end), "")
    let modules = sort(split(substitute(matched, "^.\\+\.{\\_\\s*\\(.\\{-}\\)\\_\\s*}", "\\1", ""), ",\\_\\s*"))
    echo modules
    let lines = join(map(copy(modules), 'prefix . "." . v:val'), "\n")
    s/^.\+{\_[^}]\+}$/\=lines/
  else
    let prefix = substitute(line, "\.{.\\+", "", "")
    let modules = sort(split(substitute(line, "^.\\+\.{\\(.\\+\\)}", "\\1", ""), ",\\s*"))
    let lines = join(map(copy(modules), 'prefix . "." . v:val'), "\n")
    s/^.\+{\_[^}]\+}$/\=lines/
  endif
  normal ``
endfunction
