setlocal foldmethod=expr
setlocal foldexpr=GetLookMLFold(v:lnum)

if !exists('g:lookml_foldlevel')
    let g:lookml_foldlevel = 1
endif
exe 'setlocal foldlevel=' . g:lookml_foldlevel

function! s:NextNonBlankLine(lnum)
  " could be simplified with builtin nextnonblank
  let l:numlines = line('$')
  let l:current = a:lnum + 1

  while current <= numlines
      if getline(current) =~? '\v\S'
          return current
      endif

      let l:current += 1
  endwhile

  return -2
endfunction

function! s:IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetLookMLFold(lnum)
    let l:contents = getline(a:lnum)

    if l:contents =~? '\v^(\#.*|\s*)$'
        return '-1'
    endif

    let l:this_indent = s:IndentLevel(a:lnum)
    let l:next_indent = s:IndentLevel(s:NextNonBlankLine(a:lnum))
    let l:is_closing_brace = l:contents =~? '\v^\s*\}\s*$'

    if a:lnum == line('$')
        return l:is_closing_brace ? 1 : s:IndentLevel(s:NextNonBlankLine(1))
    elseif l:next_indent <= l:this_indent
        return l:is_closing_brace ? '=' : l:this_indent
    elseif l:next_indent > l:this_indent
        return '>' . l:next_indent
    endif
endfunction
