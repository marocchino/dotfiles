function! ToggleWith()
  mark `
  let line=getline('.')
  if line =~ 'case\> .\+ do'
    s/\(\s\+\)case \(.\+\) do\n\1  \(.\+\) ->\(\s\|\n\1    \)\(.\+\)\n/\1with \3 <- \2 do\r\1  \5\r\1else\r/
  elseif line =~ 'with\> .\+ <- .\+ do'
    s/\(\s\+\)with \(.\+\) <- \(.\+\) do\n\1  \(\_.\+\)\1else\n/\1case \3 do\r\1  \2 -> \4/
  else
  endif
  normal ``
endfunction
