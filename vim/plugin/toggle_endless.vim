function! ToggleEndless()
  mark `
  let line=getline('.')
  if line !~ 'def\>.\+'
  elseif line =~ "="
    s/\(\s\+\)def\>\(.\+\) = \(.\+\)/\1def\2\r\1  \3\r\1end
  else
    s/\(\s\+\)def\>\(.\+\)\n\s\+\(\_.\{-1,}\)\1end\n/\1def\2 = \3
  endif
  normal ``
endfunction
