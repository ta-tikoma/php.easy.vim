" append property
function! php#easy#property#append(visibility)
    call php#easy#helpers#position#remember()

    normal G
    let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
        exec "normal! o/**"
    else
        exec "normal! o\<CR>/**"
    endif
    exec "normal! o@var "

    call php#easy#insert#append("php#easy#property#end(\"" . a:visibility . "\")")
endfunction

function! php#easy#property#end(visibility)
    exec "normal! o/\<CR>" . a:visibility . " $;"

    call php#easy#insert#insert("php#easy#property#end2(\"" . a:visibility . "\")")
endfunction

function! php#easy#property#end2(visibility)
    call php#easy#helpers#position#restore()

    silent! call repeat#set(":call php#easy#property#append(\"" . a:visibility . "\")\<CR>", v:count)
endfunction

" copy property
function! php#easy#property#copy()
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search("^    \\(private\\|public\\|protected\\) \\$", 'e')
    normal! y
endfunction

" replica property
function! php#easy#property#replica()
    call php#easy#property#copy()

    call search("^    \\(private\\|public\\|protected\\) \\$", 'e')
    exec "normal! o"
    normal! pzz
    call search("^    \\(private\\|public\\|protected\\) \\$", 'e')
    exec "normal! ldw"
    startinsert
endfunction

" delete property
function! php#easy#property#delete()
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search("^    \\(private\\|public\\|protected\\) \\$", 'e')
    normal! d
endfunction

" doc property
function! php#easy#property#doc()
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        echom 'insert in to comment property'
    else
        normal! jj
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        call php#easy#insert#append("")
    endif
endfunction
