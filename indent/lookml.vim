if exists('b:did_indent')
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetLookMLIndent(v:lnum)

if exists("*GetLookMLIndent")
    finish
endif

function! GetLookMLIndent(lnum)
    if a:line_num == 0
        return 0
    endif

    let l:prevlnum = prevnonblank(a:lnum-1)
    let l:thisindent = indent(l:prevlnum)

    let l:prevline = getline(l:prevlnum)
    let l:thisline = getline(a:lnum)

    if l:prevline =~# '[\{\[\(]\s*$'
        let l:thisindent += &shiftwidth
    endif

    if l:thisline =~# '[\}\]\)]\s*$'
        let l:thisindent -= &shiftwidth
    endif

    return l:thisindent
endfunction
