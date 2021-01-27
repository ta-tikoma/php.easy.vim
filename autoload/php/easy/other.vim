function! php#easy#other#log()
    exec "normal! odie(print_r([], true));"
    normal F]
    call inputsave()
    startinsert
endfunction

" change private of function or property
function! php#easy#other#changeVisibility()
    let line = getline('.')
    if stridx(line, 'public') != -1
        silent :s/public/private/g
    elseif stridx(line, 'private') != -1
        silent :s/private/protected/g
    elseif stridx(line, 'protected') != -1
        silent :s/protected/public/g
    endif

    silent! call repeat#set(":call PhpChangeVisibility()\<CR>", v:count)
endfunction
