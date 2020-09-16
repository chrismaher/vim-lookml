setlocal foldmethod=expr
setlocal foldexpr=GetLookMLFold(v:lnum)

if !exists('b:lookml_foldlevel')
    let b:lookml_foldlevel = {'model': 0, 'view': 1}[expand('%:r:e')]
endif
execute 'setlocal foldlevel=' . b:lookml_foldlevel

if expand('%:r:e') ==? 'model'
    let s:pattern = '\v\s*(explore|datagroup)\s*:'
else
    let s:pattern = '\v\s*(dimension(|_group)|measure|filter|parameter|set|derived_table)\s*:'
endif

function! GetLookMLFold(lnum)
    let l:contents = getline(a:lnum)
    if l:contents =~? '\v\s*\S+:.*\{\s*(|#.*)$'
        let l:indent = 'a1'
    elseif l:contents =~? '\v^(#|\s)*\}(\s*|#.*)$'
        let l:indent = 's1'
    else
        let l:indent = '='
    endif
    return l:indent
endfunction

function! s:Select(boundary)
    while getline('.') !~# s:pattern " '.*\{(\s*|#.*)$'
        if foldlevel('.') == 1
            return
        endif
        normal! [z
    endwhile
    if a:boundary ==# 'a'
        normal! V]z
    elseif a:boundary ==# 'i'
        normal! jV]zk
    endif
endfunction

function! s:NextSection(forward, visual)
    let l:flags = 'W'
    if ! a:forward
        let l:flags = l:flags . 'b'
    endif

    if a:visual
        normal! gv
    endif

    let l:count = v:count1

    while l:count > 0
        let l:res = search(s:pattern, l:flags)
        if l:res == 0
            break
        endif
        let l:count -= 1
    endwhile
endfunction

noremap <silent> <buffer> ]] :<c-u>call <SID>NextSection(1, 0)<CR>
noremap <silent> <buffer> [[ :<c-u>call <SID>NextSection(0, 0)<CR>

vnoremap <silent> <buffer> ]] :<c-u>call <SID>NextSection(1, 1)<CR>
vnoremap <silent> <buffer> [[ :<c-u>call <SID>NextSection(0, 1)<CR>

vnoremap <silent> <buffer> af :<c-u>call <SID>Select('a')<CR>
vnoremap <silent> <buffer> if :<c-u>call <SID>Select('i')<CR>

omap <silent> <buffer> af :normal Vaf<CR>
omap <silent> <buffer> if :normal Vif<CR>
