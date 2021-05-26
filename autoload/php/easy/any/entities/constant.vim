" append constant
function! php#easy#any#entities#constant#append()
    let l:visibility = php#easy#helpers#visibility#choose()

    normal G
    let l:lastConstant = search(g:php#easy#any#regex#constant, 'b')
    if l:lastConstant == 0
        call search('^{')
    else
        normal! o
    endif

    exec "normal! o" . l:visibility . "const ;"

    startinsert
endfunction

" copy constant
function! php#easy#any#entities#constant#copy()
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#constant, 'e')
    normal! y
endfunction

" replica constant
function! php#easy#any#entities#constant#replica()
    call php#easy#any#entities#constant#copy()

    call search(g:php#easy#any#regex#constant, 'e')
    normal! o
    normal! pzz
    call search(g:php#easy#any#regex#constant, 'e')
    normal! ldw
    startinsert
endfunction

" delete constant
function! php#easy#any#entities#constant#delete()
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#constant, 'e')
    normal! d
endfunction

" doc const
function! php#easy#any#entities#constant#doc()
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        normal! o
        startinsert!
    else
        normal! jj
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction
