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

    silent! call repeat#set(":call php#easy#other#changeVisibility()\<CR>", v:count)
endfunction

" prepend doc block
function! php#easy#other#doc()
    call php#easy#position#remember()

    call search("^    \\(private\\|public\\|protected\\) function", "bW")
    let @p = "    /**\n     * \n     */\n"
    normal "pPj
    call php#easy#insert#append("php#easy#position#restore()")
endfunction

" append space
function! php#easy#other#space()
    exec "normal! o"
endfunction
