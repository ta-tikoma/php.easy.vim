" append function
function! php#easy#function#append()
    call inputsave()
    let name = input("{function name}: ")
    call inputrestore()
    if strlen(name) == 0
        return
    endif
    let lastFunction = search("^    }")
    call s:PhpInsertFunction(name, lastFunction)
endfunction

" prepend function
function! php#easy#function#prepend()
    call inputsave()
    let name = input("Name of function: ")
    call inputrestore()
    if strlen(name) == 0
        return
    endif
    let lastFunction = search("^    }", 'b')
    call s:PhpInsertFunction(name, lastFunction)
endfunction

" copy function
function! php#easy#function#copy()
    call php#easy#position#remember()

    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "b")
    normal! V
    let l:funcitonEnd = search("^    }", "e")
    normal! y

    call php#easy#position#restore()
endfunction

" duplicate function
function! php#easy#function#duplicate()
    call php#easy#function#copy()

    let l:funcitonEnd = search("^    }", "e")
    exec "normal! o"
    normal! pzz
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "e")
    exec "normal! wdw"
    startinsert
endfunction

" rename function
function! php#easy#function#rename()
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "be")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#function#delete()
    let l:funcitonBegin = search("^    \\(private\\|public\\|protected\\) function", "b")
    normal! V
    let l:funcitonEnd = search("^    }", "e")
    normal! d
endfunction

" append constructor
function! php#easy#function#construct()
    normal G
    let lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    call s:PhpInsertFunction('__construct', lastProperty)
endfunction

" insert function
function! s:PhpInsertFunction(name, lastFunction)
    if a:lastFunction == 0
        let endOfClass = search("^}")
        exec "normal O\<CR>public function " . a:name . "()\<CR>{\<CR>}"
    else
        exec "normal o\<CR>public function " . a:name . "()\<CR>{\<CR>}"
    endif
    " let functionName = search("public function " . a:name . "()", "e")
endfunction
