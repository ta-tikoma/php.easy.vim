function! php#easy#constant#append()
    normal G
    let l:lastConstant = search("^    const ", 'b')
    if l:lastConstant == 0
        let l:beginOfClass = search("^{")
        exec "normal! oconst ;"
    else
        exec "normal! o\<CR>const ;"
    endif

    call php#easy#insert#insert("")
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
    call search("^    const ", 'e')
    normal! y
endfunction

" replica constant
function! php#easy#constant#replica()
    call php#easy#constant#copy()

    call search("^    const ", 'e')
    exec "normal! o"
    normal! pzz
    call search("^    const ", 'e')
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
    call search("^    const ", 'e')
    normal! d
endfunction
