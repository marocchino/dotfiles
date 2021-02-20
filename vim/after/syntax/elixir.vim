let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @sql syntax/sql.vim
unlet b:current_syntax
syntax include @graphql syntax/graphql.vim

" this unlet instruction is needed
" before we load each new syntax

let b:current_syntax = s:bcs

syntax region hereDocText matchgroup=elixirSigilDelimiter start=+^\s*@.\+\s"""+ end=+^\s*"""+ contains=NONE

syntax region hereDocSQL matchgroup=elixirSigilDelimiter start=+^\s*@sql\s"""+  end=+^\s*"""+ contains=@sql

syntax region hereDocGraphQL matchgroup=elixirSigilDelimiter start=+^\s*@graphql\s"""+ end=+^\s*"""+ contains=@graphql


