if !exists('g:lookml_tags')
    let basedir = lookml#GetBaseDir()
    let g:lookml_tags = join([basedir, 'tags'], '/')
endif

exe 'setlocal tags=' . g:lookml_tags

nnoremap <buffer> <c-]> :call lookml#LookerTag()<cr>

command -nargs=0 LookMLTag call lookml#GenerateTags()
