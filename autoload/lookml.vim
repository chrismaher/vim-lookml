function! lookml#NextSection(forward, visual)
    let l:flags = 'W'
    if ! a:forward
        let l:flags = l:flags . 'b'
    endif

    if a:visual
        normal! gv
    endif

    let l:count = v:count1

    while l:count > 0
        let l:res = search('\v(dimension(|_group)|measure):', l:flags)
        if l:res == 0
            break
        endif
        let l:count -= 1
    endwhile
endfunction
