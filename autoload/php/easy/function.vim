function! php#easy#function#foreach()
    exec "normal! oforeach () {\<CR>}"
    normal! kf)
    
    call php#easy#insert#insert("")
endfunction

function! php#easy#function#if()
    exec "normal! oif () {\<CR>}"
    normal! kf)

    call php#easy#insert#insert("")
endfunction

function! php#easy#function#switch()
    exec "normal! oswitch () {\<CR>}"
    normal! kf)

    call php#easy#insert#insert("")
endfunction

function! php#easy#function#else()
    exec "normal! o} else {"
endfunction
