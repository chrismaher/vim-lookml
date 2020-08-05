noremap <silent> <buffer> ]] :call lookml#NextSection(1, 0)<cr>
noremap <silent> <buffer> [[ :call lookml#NextSection(0, 0)<cr>

vnoremap <silent> <buffer> ]] :<c-u>call lookml#NextSection(1, 1)<cr>
vnoremap <silent> <buffer> [[ :<c-u>call lookml#NextSection(0, 1)<cr>
