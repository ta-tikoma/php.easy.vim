" append property
function! php#easy#property#append(visibility)
    call php#easy#position#remember()

    normal G
    let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
        exec "normal! o/**"
    else
        exec "normal! o\<CR>/**"
    endif
    exec "normal! o@var "

    call PhpAppendBegin("php#easy#property#end(\"" . a:visibility . "\")")
endfunction

function! php#easy#property#end(visibility)
    exec "normal! o/\<CR>" . a:visibility . " $;"

    call PhpInsertBegin("php#easy#property#end2(\"" . a:visibility . "\")")
endfunction

function! php#easy#property#end2(visibility)
    call PhpRestorePosition()

    silent! call repeat#set(":call php#easy#property#append(\"" . a:visibility . "\")\<CR>", v:count)
endfunction
