" copy function
function! php#easy#method#copy()
    normal! j
    call search("^    \\(private\\|public\\|protected\\) function", "b")
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif
    
    normal! V
    call search("^    }", "e")
    normal! y
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
    normal! j
    call search("^    \\(private\\|public\\|protected\\) function", "be")
    exec "normal! wdw"
    startinsert
endfunction

" delete function
function! php#easy#method#delete()
    normal! j
    call search("^    \\(private\\|public\\|protected\\) function", "b")
    " docs
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        call search("^    /", "b")
    else
        normal! j
    endif

    normal! V
    call search("^    }", "e")
    normal! d
endfunction

" doc function
function! php#easy#method#doc()
    normal! j
    call search("^    \\(private\\|public\\|protected\\) function", "b")
    normal! k
    if match(getline("."), '^\s\{5}\*') != -1
        echom 'insert in to comment'
    else
        normal! j
        let @p = "    /**\n     * \n     */\n"
        normal "pPj
        call php#easy#insert#append("")
    endif
endfunction

" append constructor
function! php#easy#method#construct()
    normal gg
    let l:firstMethod = search("^    \\(private\\|public\\|protected\\) function")
    if l:firstMethod == 0
        normal G
        let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", "b")
        exec "normal o\<CR>public function __construct()\<CR>{\<CR>}"
    else
        exec "normal O\<CR>public function __construct()\<CR>{\<CR>}\<CR>"
    endif
endfunction
