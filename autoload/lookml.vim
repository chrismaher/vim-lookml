function! lookml#Select(boundary)
    while getline('.') !~# '\v\s*(dimension(|_group)|measure)\s*:.*\{(\s*|#.*)$'
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

function! lookml#NextSection(forward, visual)
    let l:flags = 'W'
    if ! a:forward
        let l:flags = l:flags . 'b'
    endif

    if a:visual
        normal! gv
    endif

    let l:count = v:count1

    if expand('%:r:e') ==? 'model'
        let l:pattern = '\vexplore:'
    else
        let l:pattern = '\v(dimension(|_group)|measure|filter|parameter|set|derived_table):'
    endif

    while l:count > 0
        let l:res = search(l:pattern, l:flags)
        if l:res == 0
            break
        endif
        let l:count -= 1
    endwhile
endfunction
