function! php#easy#any#itIs()
    normal! k

    let l:positions = []

    let l:method = search("^    }", 'nW')
    if l:method != 0
        call add(l:positions, l:method)
    endif

    let l:constant = search("^    const ", 'nW')
    if l:constant != 0
        call add(l:positions, l:constant)
    endif

    let l:property = search("^    \\(private\\|public\\|protected\\)\\( \\w\\+\\|\\) \\$", 'nW')
    if l:property != 0
        call add(l:positions, l:property)
    endif

    if len(l:positions) == 0
        return ''
    endif
    
    let l:minPosition = min(l:positions)

    if l:minPosition == l:method
        return 'method'
    endif

    if l:minPosition == l:constant
        return 'constant'
    endif

    if l:minPosition == l:property
        return 'property'
    endif
endfunction

" copy
function! php#easy#any#copy()
    let l:itIs = php#easy#any#itIs()

    if l:itIs == 'method'
        call php#easy#method#copy()
    elseif  l:itIs == 'constant'
        call php#easy#constant#copy()
    elseif  l:itIs == 'property'
        call php#easy#property#copy()
    endif
endfunction

" replica
function! php#easy#any#replica()
    let l:itIs = php#easy#any#itIs()

    if l:itIs == 'method'
        call php#easy#method#replica()
    elseif  l:itIs == 'constant'
        call php#easy#constant#replica()
    elseif  l:itIs == 'property'
        call php#easy#property#replica()
    endif
endfunction

" delete
function! php#easy#any#delete()
    let l:itIs = php#easy#any#itIs()

    if l:itIs == 'method'
        call php#easy#method#delete()
    elseif  l:itIs == 'constant'
        call php#easy#constant#delete()
    elseif  l:itIs == 'property'
        call php#easy#property#delete()
    endif
endfunction

" phpdoc
function! php#easy#any#doc()
    let l:itIs = php#easy#any#itIs()

    if l:itIs == 'method'
        call php#easy#method#doc()
    elseif  l:itIs == 'constant'
        call php#easy#constant#doc()
    elseif  l:itIs == 'property'
        call php#easy#property#doc()
    endif
endfunction
