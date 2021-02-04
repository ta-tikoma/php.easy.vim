" append argument
function! php#easy#argument#append()
    call php#easy#position#remember()

    normal! j
    call search("function \\w\\+(", "bew")
    call php#easy#argument#insert()

    call php#easy#insert#insert("php#easy#position#restore()")
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
function! php#easy#argument#delete(number)
    call php#easy#position#remember()

    call search("function \\w\\+(", "bew")
    normal! l"pdi)^
    let l:argumentLine = @p

    call search(")")

    " if has not lines
    if match(l:argumentLine, "\n") == -1
        let l:arguments = split(l:argumentLine, ', ')
        call remove(l:arguments, a:number - 1)
        let @p = join(l:arguments, ', ')
        normal! h"pp
    else
        let l:arguments = split(l:argumentLine, ",\n")
        call remove(l:arguments, a:number - 1)
        let @p = join(l:arguments, ",\n")
        call search("(", "be")
        normal! "pp
    endif

    call php#easy#position#restore()
endfunction
