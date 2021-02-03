function! php#easy#function#foreach()
    exec "normal! o\<CR>foreach () {\<CR>}"
    normal! kf)
    
    call php#easy#insert#insert("")
endfunction

function! php#easy#function#if()
    exec "normal! o\<CR>if () {\<CR>}"
    normal! kf)

    call php#easy#insert#insert("")
endfunction

function! php#easy#function#else()
    exec "normal! o} else {"
endfunction
