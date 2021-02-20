let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @sql syntax/sql.vim

unlet b:current_syntax
syntax include @graphql syntax/graphql.vim

unlet b:current_syntax
syntax include @json syntax/javascript.vim

let b:current_syntax = s:bcs

syntax region hereDocSQL     matchgroup=elixirSigilDelimiter start=+^\s*@sql\s"""+     end=+^\s*"""+ contains=@sql     fold keepend
syntax region hereDocGraphQL matchgroup=elixirSigilDelimiter start=+^\s*@graphql\s"""+ end=+^\s*"""+ contains=@graphql fold keepend
syntax region hereDocJSON    matchgroup=elixirSigilDelimiter start=+^\s*@json\s"""+    end=+^\s*"""+ contains=@json    fold keepend
