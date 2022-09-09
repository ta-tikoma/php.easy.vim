" append method
function! php#easy#any#entities#method#append()
    let l:visibility = php#easy#helpers#visibility#choose()

    normal G
    let l:lastMethod = search(g:php#easy#any#regex#methodEnd, 'b')
    if l:lastMethod == 0
        call search('^}')
        exec "normal! O\<CR>\<CR>\<Esc>k"
    else
        exec "normal! o\<CR>"
    endif

    let @p = g:php#easy#any#regex#tab . l:visibility . "function \n" . g:php#easy#any#regex#tab . "{\n" . g:php#easy#any#regex#tab . "\n" . g:php#easy#any#regex#tab . "}"
    normal "pP

    startinsert!
endfunction

" copy function
function! php#easy#any#entities#method#copy()
    normal! j
    call search(g:php#easy#any#regex#method, "b")
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif
    
    normal! V
    call search(g:php#easy#any#regex#methodEnd, "e")
    normal! y
endfunction

" duplicate function
function! php#easy#any#entities#method#replica()
    call php#easy#any#entities#method#copy()

    call search(g:php#easy#any#regex#methodEnd, "e")
    normal! o
    normal! pzz
    call search(g:php#easy#any#regex#method, "e")
    normal! wdw
    startinsert
endfunction

" delete function
function! php#easy#any#entities#method#delete()
    normal! j
    call search(g:php#easy#any#regex#method, "b")
    " docs
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        call search(g:php#easy#any#regex#comment, "b")
    else
        normal! j
    endif

    normal! V
    call search(g:php#easy#any#regex#methodEnd, "e")
    normal! d
endfunction

" doc function
function! php#easy#any#entities#method#doc()
    normal! k
    if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
        normal! O
        startinsert!
    else
        normal! j
        let @p = g:php#easy#any#regex#tab . "/**\n" . g:php#easy#any#regex#tab . " * \n" . g:php#easy#any#regex#tab . " */\n"
        normal "pPj
        startinsert!
    endif
endfunction

" rename function
function! php#easy#any#entities#method#rename()
    normal! j
    call search(g:php#easy#any#regex#method, "be")
    normal! wdw
    startinsert
endfunction


" make construct function
function! php#easy#any#entities#method#construct()
    normal! gg
    let l:firstMethod = search(g:php#easy#any#regex#method)
    if l:firstMethod == 0
        normal G
    else
        normal! k
        if match(getline("."), g:php#easy#any#regex#commentEnd) != -1
            call search(g:php#easy#any#regex#comment, "b")
        else
            normal! j
        endif
    endif
    exec "normal! O\<CR>public function __construct()\<CR>{\<CR>}\<CR>"

    call search('public function __construct(', 'ew')

    call php#easy#argument#insert()
endfunction
