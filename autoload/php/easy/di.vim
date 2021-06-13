" append dependency injection
function! php#easy#di#append()
    call php#easy#helpers#position#remember()

    " find or create constructor
    let l:constructorBegin = search('public function __construct(', 'ew')
    if l:constructorBegin == 0
        call php#easy#di#construct()
        call search('public function __construct(', 'ew')
    endif

    call php#easy#argument#insert()

    call php#easy#helpers#insert#insert("php#easy#di#end()")
endfunction

function! php#easy#di#end()
    " copy arguments
    call search('public function __construct(', 'bew')
    normal! l"pyi)
    let l:input = trim(@p)
    if len(l:input) == 0
        return
    endif

    let l:arguments = split(l:input, ',')

    " set properies value by arguments
    call search("{")
    for argument in l:arguments
        let l:name = split(trim(argument))[1][1:]
        let l:propertyExist = search(g:php#easy#any#regex#property . l:name, 'wn')
        if l:propertyExist == 0
            exec "normal! o$this->" . l:name . " = $" . l:name . ";"
        endif
    endfor

    " add properies
    normal! G
    let l:lastProperty = search(g:php#easy#any#regex#property, 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
    else
        exec "normal! o"
    endif

    for argument in l:arguments
        let l:argument = trim(argument)
        let l:propertyExist = search(g:php#easy#any#regex#visibility . l:argument, 'wn')
        if l:propertyExist == 0
            exec "normal! oprivate " . l:argument . ";"
        endif
    endfor

    call php#easy#helpers#position#restore()
endfunction

" append constructor
function! php#easy#di#construct()
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
endfunction
