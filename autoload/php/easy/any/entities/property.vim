" append property
function! php#easy#any#entities#property#append(visibility)
    normal G
    let l:lastProperty = search(g:php#easy#any#regex#property, 'b')
    if l:lastProperty == 0
        call search("^{")
        exec "normal! o" . a:visibility . " ;"
    else
        exec "normal! o\<CR>" . a:visibility . " ;"
    endif

    startinsert
endfunction

" copy property
function! php#easy#any#entities#property#copy()
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#property, 'e')
    normal! y
endfunction

" replica property
function! php#easy#any#entities#property#replica()
    call php#easy#any#entities#property#copy()

    call search(g:php#easy#any#regex#property, 'e')
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#any#regex#property, 'e')
    exec "normal! ldw"
    startinsert
endfunction

" delete property
function! php#easy#any#entities#property#delete()
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#property, 'e')
    normal! d
endfunction

" doc property
function! php#easy#any#entities#property#doc()
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        echom 'insert in to comment property'
    else
        normal! jj
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction
