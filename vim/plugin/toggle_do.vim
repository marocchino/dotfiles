function! ToggleDo()
  mark `
  let line=getline('.')
  if line !~ 'def\>.\+do'
  elseif line =~ "do:"
    s/\(\s\+\)def\>\(.\+\), do: \(.\+\)/\1def\2 do\r\1  \3\r\1end
  else
    s/\(\s\+\)def\>\(.\+\) do\n\s\+\(\_.\{-1,}\)\1end\n/\1def\2, do: \3
  endif
  normal ``
endfunction
