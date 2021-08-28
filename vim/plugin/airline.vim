let g:airline_powerline_fonts = 1

if filereadable(expand('~/.toggle_dark'))
let g:airline_theme='tender'
else
let g:airline_theme='papercolor'
endif

let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S',
\ }

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.paste = "\uf0ea"
let g:airline_symbols.readonly = "\ue0a2"
let g:airline_symbols.modified = "\uf459"
let g:airline_symbols.spell = "\uf49e"
let g:airline_symbols.branch = "\uf418"
let g:airline_section_x = ''

" let g:airline_left_sep = "\uE0B4"
" let g:airline_left_alt_sep = "\uE0B5"
" let g:airline_right_sep = "\uE0B6"
" let g:airline_right_alt_sep = "\uE0B7"
