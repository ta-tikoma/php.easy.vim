" append function
function! php#easy#function#append()
    normal! k
    let lastFunction = search("^    }")
    if l:lastFunction == 0
        call search("^}")
        exec "normal O\<CR>public function "
    else
        exec "normal o\<CR>public function "
    endif

    call php#easy#insert#append("php#easy#function#end()")
endfunction

function! php#easy#function#end()
    exec "normal o{}"
    startinsert
endfunction

" prepend function
function! php#easy#function#prepend()
    normal! j 
    let lastFunction = search("^    \\(private\\|public\\|protected\\) function", 'b')
    if l:lastFunction == 0
        call search("^}")
        exec "normal O\<CR>public function "
    else
        exec "normal O"
        exec "normal O\<CR>public function "
    endif

    call php#easy#insert#append("php#easy#function#end()")
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
