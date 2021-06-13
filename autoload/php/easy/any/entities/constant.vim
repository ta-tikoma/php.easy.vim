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

function! s:SelectConstant()
    " docs
    normal! 0
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#constant, 'e')
endfunction

" copy constant
function! php#easy#any#entities#constant#copy()
    call s:SelectConstant()
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
    call s:SelectConstant()
    normal! d
endfunction

" doc const
function! php#easy#any#entities#constant#doc()
    call php#easy#any#entities#property#doc()
endfunction
