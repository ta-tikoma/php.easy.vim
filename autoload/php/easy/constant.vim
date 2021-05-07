let g:php#easy#constant#regex = '^    \(public\|protected\|private\|\) const '

" append constant
function! php#easy#constant#append(visibility)
    normal G
    let l:lastConstant = search(g:php#easy#constant#regex, 'b')
    if l:lastConstant == 0
        call search('^{')
        exec "normal! o" . a:visibility . " const ;"
    else
        exec "normal! o\<CR>" . a:visibility . " const ;"
    endif

    startinsert
endfunction

" copy constant
function! php#easy#constant#copy()
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#constant#regex, 'e')
    normal! y
endfunction

" replica constant
function! php#easy#constant#replica()
    call php#easy#constant#copy()

    call search(g:php#easy#constant#regex, 'e')
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#constant#regex, 'e')
    exec "normal! ldw"
    startinsert
endfunction

" delete constant
function! php#easy#constant#delete()
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#constant#regex, 'e')
    normal! d
endfunction

" doc const
function! php#easy#constant#doc()
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
