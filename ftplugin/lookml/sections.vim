noremap <script> <buffer> <silent> ]]
        \ :call lookml#NextSection(1, 0, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call lookml#NextSection(1, 1, 0)<cr>

noremap <script> <buffer> <silent> ][
        \ :call lookml#NextSection(2, 0, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call lookml#NextSection(2, 1, 0)<cr>

vnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call lookml#NextSection(1, 0, 1)<cr>

vnoremap <script> <buffer> <silent> [[
        \ :<c-u>call lookml#NextSection(1, 1, 1)<cr>

vnoremap <script> <buffer> <silent> ][
        \ :<c-u>call lookml#NextSection(2, 0, 1)<cr>

vnoremap <script> <buffer> <silent> []
        \ :<c-u>call lookml#NextSection(2, 1, 1)<cr>
