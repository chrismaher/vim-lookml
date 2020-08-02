setlocal foldmethod=expr
setlocal foldexpr=GetLookMLFold(v:lnum)

if !exists('g:lookml_foldlevel')
    let g:lookml_foldlevel = 1
endif
exe 'setlocal foldlevel=' . g:lookml_foldlevel

function! GetLookMLFold(lnum)
    let l:contents = getline(a:lnum)
    if l:contents =~? '\v\s*\S+:.*\{(\s*|#.*)$'
        let l:indent = 'a1'
    elseif l:contents =~? '\v^(#|\s)*\}(\s*|#.*)$'
        let l:indent = 's1'
    else
        let l:indent = '='
    endif
    return l:indent
endfunction
