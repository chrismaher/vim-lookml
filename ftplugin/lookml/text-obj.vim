function! AF()
    while getline('.') !~# '\v\s*(dimension(|_group)|measure)\s*:.*\{(\s*|#.*)$'
        if foldlevel('.') == 1
            return
        endif
        normal! [z
    endwhile
    normal! V]z
endfunction

function! IF()
    while getline('.') !~# '\v\s*(dimension(|_group)|measure)\s*:.*\{(\s*|#.*)$'
        if foldlevel('.') == 1
            return
        endif
        normal! [z
    endwhile
    normal! jV]zk
endfunction

vnoremap af :<C-U>silent! call AF()<CR>
vnoremap if :<C-U>silent! call IF()<CR>
" vnoremap af :<C-U>silent! normal! [zV]z<CR>
" vnoremap if :<C-U>silent! normal! [zjV]zk<CR>

omap af :normal Vaf<CR>
omap if :normal Vif<CR>
