" append argument
function! php#easy#argument#append()
    call php#easy#position#remember()

    let l:funcitonBegin = search("function \\w\\+(", "bew")
    call php#easy#argument#insert()

    call php#easy#insert#insert("php#easy#position#restore()")
endfunction

" insert argument
function! php#easy#argument#insert()
    normal! l"pyi)
    let l:arguments = @p

    let l:endBracket = search(")")

    " if has not lines
    if match(l:arguments, "\n") == -1
        " if has arguments
        if len(l:arguments) != 0
            exec "normal! i, "
            exec "normal! l"
        endif
    else
        exec "normal! kA,\<CR> "
    endif
endfunction
