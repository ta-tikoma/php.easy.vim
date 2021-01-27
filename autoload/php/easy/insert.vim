"#####################################
"# INSERT
"#####################################


let g:phpInsertStack = []

function! php#easy#insert#insert(command)
    call add(g:phpInsertStack, a:command)
    startinsert
endfunction

function! php#easy#insert#append(command)
    call add(g:phpInsertStack, a:command)
    startinsert!
endfunction

function! php#easy#insert#end()
    if len(g:phpInsertStack) == 0
        return
    endif
    let l:command = g:phpInsertStack[0]
    call remove(g:phpInsertStack, 0)
    exec "call " . l:command 
endfunction
