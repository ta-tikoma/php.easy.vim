let g:php#easy#any#constant#regex = '^    \(public\|protected\|private\|\) const '

" append constant
function! php#easy#any#constant#append(visibility)
    normal G
    let l:lastConstant = search(g:php#easy#any#constant#regex, 'b')
    if l:lastConstant == 0
        call search('^{')
    else
        normal! o
    endif

    exec "normal! o" . a:visibility . " const ;"

    startinsert
endfunction

" copy constant
function! php#easy#any#constant#copy()
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#constant#regex, 'e')
    normal! y
endfunction

" replica constant
function! php#easy#any#constant#replica()
    call php#easy#any#constant#copy()

    call search(g:php#easy#any#constant#regex, 'e')
    exec "normal! o"
    normal! pzz
    call search(g:php#easy#any#constant#regex, 'e')
    exec "normal! ldw"
    startinsert
endfunction

" delete constant
function! php#easy#any#constant#delete()
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#constant#regex, 'e')
    normal! d
endfunction

" doc const
function! php#easy#any#constant#doc()
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
