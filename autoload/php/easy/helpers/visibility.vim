function! php#easy#helpers#visibility#choose()
    echon '0:none 1:private 2:protected 3:public'

    let l:choice = nr2char(getchar())

    if l:choice == 1
        return 'private '
    endif
    
    if l:choice == 2
        return 'protected '
    endif

    if l:choice == 3
        return 'public '
    endif

    return ''
endfunction
