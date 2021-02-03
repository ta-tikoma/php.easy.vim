" append function
function! php#easy#method#append()
    normal! k
    let l:lastFunction = search("^    }")
    if l:lastFunction == 0
        call search("^}")
        exec "normal! Opublic function ()\<CR>{\<CR>}"
    else
        exec "normal! o\<CR>public function ()\<CR>{\<CR>}"
    endif
    normal! kk$xx

    call php#easy#insert#append("php#easy#method#end()")
endfunction

function! php#easy#method#end()
    call search("{")
    " exec "normal! O "

    " startinsert!
endfunction

" prepend function
function! php#easy#method#prepend()
    normal! j 
    let l:lastFunction = search("^    \\(private\\|public\\|protected\\) function", 'b')
    if l:lastFunction == 0
        call search("^}")
        exec "normal! Opublic function ()\<CR>{\<CR>}"
    else
        exec "normal! O"
        exec "normal! Opublic function ()\<CR>{\<CR>}"
    endif
    normal! kk$xx

    call php#easy#insert#append("php#easy#method#end()")
endfunction

" copy function
function! php#easy#method#copy()
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
function! php#easy#method#replica()
    call php#easy#method#copy()

    call search("^    }", "e")
    exec "normal! o"
    normal! pzz
    call search("^    \\(private\\|public\\|protected\\) function", "e")
    exec "normal! wdw"
    startinsert
endfunction

" rename function
function! php#easy#method#rename()
    call search("^    \\(private\\|public\\|protected\\) function", "be")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#method#delete()
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
function! php#easy#method#construct()
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
