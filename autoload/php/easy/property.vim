let g:php#easy#property#regex = '^    \(public\)\(\s?*\w\+\|\) \$'

" append property
function! php#easy#property#append(visibility)
    normal G
    let l:lastProperty = search(g:php#easy#property#regex, 'b')
    if l:lastProperty == 0
        call search("^{")
        exec "normal! o" . a:visibility . " ;"
    else
        exec "normal! o\<CR>" . a:visibility . " ;"
    endif

    startinsert
endfunction

" copy property
function! php#easy#property#copy()
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#property#regex, 'e')
    normal! y
endfunction

" replica property
function! php#easy#property#replica()
    call php#easy#property#copy()

    call search(g:php#easy#property#regex, 'e')
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#property#regex, 'e')
    exec "normal! ldw"
    startinsert
endfunction

" delete property
function! php#easy#property#delete()
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#property#regex, 'e')
    normal! d
endfunction

" doc property
function! php#easy#property#doc()
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        echom 'insert in to comment property'
    else
        normal! jj
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction
