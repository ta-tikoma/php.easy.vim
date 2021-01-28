" append dependency injection
function! php#easy#di#append()
    call php#easy#position#remember()

    " find or create constructor
    let l:constructorBegin = search('public function __construct(', 'ew')
    if l:constructorBegin == 0
        call php#easy#function#construct()
        call search('public function __construct(', 'ew')
    endif

    call php#easy#argument#insert()

    call php#easy#insert#insert("php#easy#di#end()")
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
        let l:typeAndName = split(trim(argument))
        let l:propertyExist = search("^    \\(private\\|public\\|protected\\) " . l:typeAndName[1], 'wn')
        if l:propertyExist == 0
            let l:name = typeAndName[1][1:]
            exec "normal! o$this->" . l:name . " = $" . l:name . ";"
        endif
    endfor

    " add properies
    normal! G
    let l:lastProperty = search("^    \\(private\\|public\\|protected\\) \\$", 'b')
    if l:lastProperty == 0
        let l:beginOfClass = search("^{")
    else
        exec "normal! o"
    endif
    for argument in l:arguments
        let l:typeAndName = split(trim(argument))
        let l:propertyExist = search("^    \\(private\\|public\\|protected\\) " . l:typeAndName[1], 'wn')
        if l:propertyExist == 0
            exec "normal! o/**\<CR>@var " . l:typeAndName[0] . "\<CR>/\<CR>private " . l:typeAndName[1] . ";"
        endif
    endfor

    call php#easy#position#restore()
endfunction
