function! php#easy#other#log()
    exec "normal! odie(print_r([], true));"
    normal F]
    call inputsave()
    startinsert
endfunction

" change private of function or property
function! php#easy#other#changeVisibility()
    let l:line = getline('.')
    if stridx(l:line, 'public') != -1
        silent :s/public/private/g
    elseif stridx(l:line, 'private') != -1
        silent :s/private/protected/g
    elseif stridx(l:line, 'protected') != -1
        silent :s/protected/public/g
    endif
endfunction

" append space
function! php#easy#other#space()
    exec "normal! o"
endfunction
