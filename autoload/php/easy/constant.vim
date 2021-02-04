function! php#easy#constant#append()
    call php#easy#position#remember()

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