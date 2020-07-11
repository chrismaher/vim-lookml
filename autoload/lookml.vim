function! lookml#GetBaseDir()
    " find the project's base directory by locating
    " the .git directory
    let l:root = fnamemodify('~', ':p')
    let l:cwd = getcwd()

    while (l:cwd . '/') != l:root
        let s:git = join([l:cwd, '.git'], '/')
        if isdirectory(s:git)
            return l:cwd
        endif
        let l:cwd = fnamemodify(l:cwd, ':h')
	endwhile
endfunction

function! lookml#GenerateTags()
    let cwd = getcwd()
    let basedir = lookml#GetBaseDir()
    call chdir(basedir)
    silent exe '! ctags -R -f ' . './tags .'
    call chdir(cwd)
    exe ':redraw!'
endfunction

function! lookml#LookerTag()
    let isk_orig = &isk
    set isk+=.
    let keyword = expand('<cword>')
    let &isk = isk_orig
    let parts = split(keyword, '\V.')
    if len(parts) == 1
        exe 'tag' parts[0]
    elseif len(parts) == 2
        let [mod, fun] = parts
        let i = 0
        echom expand('%')
        let fun_taglist = taglist('^' . fun . '$', expand('%'))
        for item in fun_taglist
            let filename = fnamemodify(item.filename, ':t:r:r')
            let i += 1
            if filename == mod
                silent exe i . 'tag' fnameescape(item.name)
                break
            endif
        endfor
    endif
    silent exe 'norm! zO'
endfunction

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

function! lookml#NextNonBlankLine(lnum)
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

function! lookml#IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
