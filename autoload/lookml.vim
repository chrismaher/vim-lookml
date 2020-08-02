function! lookml#NextSection(type, backwards, visual)
    if a:visual
        normal! gv
    endif

    if a:type == 1
        let pattern = '\v\n^(#|\s)*(dimension(|_group)|fields|measure|set|join):'
        let flags = 'e'
    elseif a:type == 2
        let pattern = '\v\n\n^(datagroup|explore|view|%^):'
        let flags = 'e'
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction
