" append argument
function! php#easy#argument#append()
    call php#easy#helpers#position#remember()

    normal! j
    call search("function \\w\\+(", "bew")
    call php#easy#argument#insert()

    call php#easy#helpers#insert#insert("php#easy#helpers#position#restore()")
endfunction
 
" insert argument
function! php#easy#argument#insert()
    normal! l"pyi)^
    let l:arguments = @p

    call search(")")

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

" delete argument
function! php#easy#argument#delete()
    call php#easy#helpers#position#remember()

    echon 'number of argument:'
    let l:number = nr2char(getchar())

    call search("function \\w\\+(", "bew")
    normal! l"pdi)^
    let l:argumentLine = @p

    call search(")")

    " if has not lines
    if match(l:argumentLine, "\n") == -1
        let l:arguments = split(l:argumentLine, ', ')
        call remove(l:arguments, l:number - 1)
        let @p = join(l:arguments, ', ')
        normal! h"pp
    else
        let l:arguments = split(l:argumentLine, ",\n")
        call remove(l:arguments, l:number - 1)
        let @p = join(l:arguments, ",\n")
        call search("(", "be")
        normal! "pp
    endif

    call php#easy#helpers#position#restore()
endfunction
