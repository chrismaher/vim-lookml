if exists("b:current_syntax")
    finish
endif

" Liquid syntax highlighting
syntax match liquidParameter '\v\$\{.{-}\}'
highlight link liquidParameter Identifier

syntax match sqlStart 'sql:'
highlight link sqlStart Keyword

" Add SQL syntax highlighting
syntax include @sql syntax/sql.vim
syntax region sqlQuery start=/\vsql:/rs=e end=/\v;;/rs=s-1 contains=sqlStart,liquidParameter,@sql containedin=ALL

syntax match lookerKeyword '\v^\s*\S+:'
highlight link lookerKeyword Keyword

syntax region lookerString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region lookerString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link lookerString String

syntax match lookerComment '\v#.*$'
highlight link lookerComment Comment

syntax match lookerOperator '\v\*'
syntax match lookerOperator '\v/'
syntax match lookerOperator '\v\+'
syntax match lookerOperator '\v-'
syntax match lookerOperator '\v\?'
syntax match lookerOperator '\v\='
syntax match lookerOperator '\v\*\='
syntax match lookerOperator '\v/\='
syntax match lookerOperator '\v\+\='
syntax match lookerOperator '\v-\='
highlight link lookerOperator Operator

syntax match lookerNumber '\v<\d+>'
syntax match lookerNumber '\v<\d+\.\d+>'
highlight link lookerNumber Number

let b:current_syntax = 'lookml'
