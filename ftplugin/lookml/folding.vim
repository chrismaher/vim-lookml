setlocal foldmethod=expr
setlocal foldexpr=GetLookMLFold(v:lnum)

if !exists('g:lookml_foldlevel')
    let g:lookml_foldlevel = 1
endif
exe 'setlocal foldlevel=' . g:lookml_foldlevel

function! GetLookMLFold(lnum)
    let l:contents = getline(a:lnum)

    if l:contents =~? '\v^(\#.*|\s*)$'
        return '-1'
    endif

    let l:this_indent = lookml#IndentLevel(a:lnum)
    let l:next_indent = lookml#IndentLevel(lookml#NextNonBlankLine(a:lnum))
    let l:is_closing_brace = l:contents =~? '\v^\s*\}\s*$'

    if a:lnum == line('$')
        return l:is_closing_brace ? 1 : lookml#IndentLevel(lookml#NextNonBlankLine(1))
    elseif l:next_indent <= l:this_indent
        return l:is_closing_brace ? '=' : l:this_indent
    elseif l:next_indent > l:this_indent
        return '>' . l:next_indent
    endif
endfunction
