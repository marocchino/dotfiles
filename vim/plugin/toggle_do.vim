function! ToggleDo()
  mark `
  let line=getline('.')
  if line !~ 'def\>.\+do'
  elseif line =~ "do:"
    s/\(\s\+\)\(defp\?\>\)\(.\+\), do: \(.\+\)/\1\2\3 do\r\1  \4\r\1end
  else
    s/\(\s\+\)\(defp\?\>\)\(.\+\) do\n\s\+\(\_.\{-1,}\)\1end\n/\1\2\3, do: \4
  endif
  normal ``
endfunction
