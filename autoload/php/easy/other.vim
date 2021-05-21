function! php#easy#other#log()
    exec "normal! odie(print_r([], true));"
    normal F]
    call inputsave()
    startinsert
endfunction

" change private of function or property
function! php#easy#other#changeVisibility(visibility)
    silent exec ':s/\(private\|protected\|public\)/' . a:visibility . '/g'
endfunction

" append space
function! php#easy#other#space()
    exec "normal! o"
endfunction
