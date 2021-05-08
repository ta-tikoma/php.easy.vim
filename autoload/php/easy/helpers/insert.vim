"#####################################
"# INSERT
"#####################################


let g:phpInsertStack = []

function! php#easy#helpers#insert#insert(command)
    if len(a:command) != 0
        call add(g:phpInsertStack, a:command)
    endif
    startinsert
endfunction

function! php#easy#helpers#insert#append(command)
    if len(a:command) != 0
        call add(g:phpInsertStack, a:command)
    endif
    startinsert!
endfunction

function! php#easy#helpers#insert#is()
    return (len(g:phpInsertStack) == 0)
endfunction

function! php#easy#helpers#insert#end()
    if php#easy#helpers#insert#is()
        return
    endif
    let l:command = g:phpInsertStack[0]
    call remove(g:phpInsertStack, 0)
    exec "call " . l:command 
endfunction

