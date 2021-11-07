function! ToggleDo()
  mark `
  let line=getline('.')
  if line !~# 'defp\?\>.\+do'
  elseif line =~# 'do:'
    s/^\(\s\+\)\(defp\?\>.\+\), do: \(.\+\)/\1\2 do\r\1  \3\r\1end
  else
    s/^\(\s\+\)\(defp\?\>.\+\) do\n\1\s\+\(\_.\{-1,}\)\1end\n/\1\2, do: \3
  endif
  normal! ``
endfunction
