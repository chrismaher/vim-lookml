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

    let prevlnum = prevnonblank(a:lnum-1)
    let thisindent = indent(prevlnum)

    let prevline = getline(prevlnum)
    let thisline = getline(a:lnum)

    if prevline =~# '[\{\[\(]\s*$'
        let thisindent += &shiftwidth
    endif

    if thisline =~# '[\}\]\)]\s*$'
        let thisindent -= &shiftwidth
    endif

    return thisindent
endfunction
