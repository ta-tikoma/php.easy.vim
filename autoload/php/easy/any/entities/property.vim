" append property
function! php#easy#any#entities#property#append()
    let l:visibility = php#easy#helpers#visibility#choose()

    normal G
    let l:lastProperty = search(g:php#easy#any#regex#property, 'b')
    if l:lastProperty == 0
        call search('^{')
        exec "normal! o" . l:visibility . ";"
    else
        exec "normal! o\<CR>" . l:visibility . ";"
    endif

    startinsert
endfunction

function! s:SelectProperty()
    " docs
    normal! k0
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    " todo: define array in property
    normal! V
    call search(g:php#easy#any#regex#property, 'e')
endfunction

" copy property
function! php#easy#any#entities#property#copy()
    call s:SelectProperty()
    normal! y
endfunction

" replica property
function! php#easy#any#entities#property#replica()
    call php#easy#any#entities#property#copy()

    call search(g:php#easy#any#regex#property, 'e')
    normal! o
    normal! pzz
    call search(g:php#easy#any#regex#property, 'e')
    normal! ldw
    startinsert
endfunction

" delete property
function! php#easy#any#entities#property#delete()
    call s:SelectProperty()
    normal! d
endfunction

" doc property
function! php#easy#any#entities#property#doc()
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        normal! o
        startinsert!
    else
        normal! j
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        startinsert!
    endif
endfunction
