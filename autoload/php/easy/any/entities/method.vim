" append method
function! php#easy#any#entities#method#append(visibility)
    normal G
    let l:lastMethod = search(g:php#easy#any#regex#methodEnd, 'b')
    if l:lastMethod == 0
        call search('^}')
        exec "normal! O" . a:visibility . " function "
    else
        exec "normal! o\<CR>" . a:visibility . " function "
    endif

    startinsert!
endfunction

" copy function
function! php#easy#any#entities#method#copy()
    normal! j
    call search(g:php#easy#any#regex#method, "b")
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif
    
    normal! V
    call search(g:php#easy#any#regex#methodEnd, "e")
    normal! y
endfunction

" duplicate function
function! php#easy#any#entities#method#replica()
    call php#easy#any#entities#method#copy()

    call search(g:php#easy#any#regex#methodEnd, "e")
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#any#regex#method, "e")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#any#entities#method#delete()
    normal! j
    call search(g:php#easy#any#regex#method, "b")
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#methodEnd, "e")
    normal! d
endfunction

" doc function
function! php#easy#any#entities#method#doc()
    normal! j
    call search(g:php#easy#any#regex#method, "b")
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        echom 'insert in to comment'
    else
        normal! j
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction

" rename function
function! php#easy#any#entities#method#rename()
    normal! j
    call search(g:php#easy#any#regex#method, "be")
    exec "normal! wdw"
    startinsert
endfunction
