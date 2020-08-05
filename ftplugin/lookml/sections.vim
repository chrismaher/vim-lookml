noremap <silent> <buffer> ]] :call lookml#NextSection(1, 0)<CR>
noremap <silent> <buffer> [[ :call lookml#NextSection(0, 0)<CR>
vnoremap <silent> <buffer> ]] :<c-u>call lookml#NextSection(1, 1)<CR>
vnoremap <silent> <buffer> [[ :<c-u>call lookml#NextSection(0, 1)<CR>
