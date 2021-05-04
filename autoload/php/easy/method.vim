let g:php#easy#method#regex = '^    \(private\|public\|protected\) function'

" append method
function! php#easy#method#append(visibility)
    normal G
    let l:lastMethod = search('^    }', 'b')
    if l:lastMethod == 0
        call search("^{")
        exec "normal! o" . a:visibility . " function "
    else
        exec "normal! o\<CR>" . a:visibility . " function "
    endif

    startinsert!
endfunction

" copy function
function! php#easy#method#copy()
    normal! j
    call search(g:php#easy#method#regex, "b")
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif
    
    normal! V
    call search("^    }", "e")
    normal! y
endfunction

" duplicate function
function! php#easy#method#replica()
    call php#easy#method#copy()

    call search("^    }", "e")
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#method#regex, "e")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#method#delete()
    normal! j
    call search(g:php#easy#method#regex, "b")
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search("^    }", "e")
    normal! d
endfunction

" doc function
function! php#easy#method#doc()
    normal! j
    call search(g:php#easy#method#regex, "b")
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        echom 'insert in to comment'
    else
        normal! j
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction

" rename function
function! php#easy#method#rename()
    normal! j
    call search(g:php#easy#method#regex, "be")
    exec "normal! wdw"
    startinsert
endfunction
