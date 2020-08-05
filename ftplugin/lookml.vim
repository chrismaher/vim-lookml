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

noremap <silent> <buffer> ]] :<c-u>call lookml#NextSection(1, 0)<cr>
noremap <silent> <buffer> [[ :<c-u>call lookml#NextSection(0, 0)<cr>

vnoremap <silent> <buffer> ]] :<c-u>call lookml#NextSection(1, 1)<cr>
vnoremap <silent> <buffer> [[ :<c-u>call lookml#NextSection(0, 1)<cr>

vnoremap <silent> <buffer> af :<c-u>call lookml#AF()<cr>
vnoremap <silent> <buffer> if :<c-u>call lookml#IF()<cr>

omap <silent> <buffer> af :normal Vaf<CR>
omap <silent> <buffer> if :normal Vif<CR>
