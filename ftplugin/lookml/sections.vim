function! Next(forward)
    let l:flags = 'W'
    if ! a:forward
        let l:flags = l:flags . 'b'
    endif

    let l:count = v:count
    if l:count > 0
        let l:count -= 1
    endif

    while l:count >= 0
        let l:res = search('\v(dimension(|_group)|measure):', l:flags)
        if l:res == 0
            break
        endif
        let l:count -= 1
    endwhile
endfunction

noremap <silent> <buffer> ]] :<c-u>call Next(1)<CR>
noremap <silent> <buffer> [[ :<c-u>call Next(0)<CR>
