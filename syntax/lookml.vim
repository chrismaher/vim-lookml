if exists("b:current_syntax")
    finish
endif

syntax match lookerKeyword '\v^\s*\S+:'
highlight link lookerKeyword Keyword

syntax region liquidParameter start=/\v\$\{/ end=/\v\}/
highlight link liquidParameter Identifier

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
