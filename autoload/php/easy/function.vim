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

    call search("^    \\(private\\|public\\|protected\\) function", "b")
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif
    
    normal! V
    call search("^    }", "e")
    normal! y

    call php#easy#position#restore()
endfunction

" duplicate function
function! php#easy#function#replica()
    call php#easy#function#copy()

    call search("^    }", "e")
    exec "normal! o"
    normal! pzz
    call search("^    \\(private\\|public\\|protected\\) function", "e")
    exec "normal! wdw"
    startinsert
endfunction

" rename function
function! php#easy#function#rename()
    call search("^    \\(private\\|public\\|protected\\) function", "be")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#function#delete()
    call search("^    \\(private\\|public\\|protected\\) function", "b")
    " docs
    normal! k
    if match(getline("."), "^    *") != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search("^    }", "e")
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
