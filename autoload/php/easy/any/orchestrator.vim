function! php#easy#any#orchestrator#itIs()
    normal! k

    " if we on docblock go to end
    if match(getline("."), g:php#easy#any#regex#commentMiddle) != -1
        call search(g:php#easy#any#regex#commentEnd)
    endif

    let l:positions = []

    " search near method
    let l:method = search(g:php#easy#any#regex#methodEnd, 'nW')
    if l:method != 0
        call add(l:positions, l:method)
    endif

    " search near constant
    let l:constant = search(g:php#easy#any#regex#constant, 'nW')
    if l:constant != 0
        call add(l:positions, l:constant)
    endif

    " search near property
    let l:property = search(g:php#easy#any#regex#property, 'nW')
    if l:property != 0
        call add(l:positions, l:property)
    endif

    " search near variable
    let l:variable = search(g:php#easy#any#regex#variable, 'nW')
    if l:variable != 0
        call add(l:positions, l:variable)
    endif

    if len(l:positions) == 0
        return ''
    endif
    
    let l:minPosition = min(l:positions)

    if l:minPosition == l:variable
        return 'variable'
    endif

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
function! php#easy#any#orchestrator#copy()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#entities#method#copy()
    elseif  l:itIs == 'constant'
        call php#easy#any#entities#constant#copy()
    elseif  l:itIs == 'property'
        call php#easy#any#entities#property#copy()
    endif
endfunction

" replica
function! php#easy#any#orchestrator#replica()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#entities#method#replica()
    elseif  l:itIs == 'constant'
        call php#easy#any#entities#constant#replica()
    elseif  l:itIs == 'property'
        call php#easy#any#entities#property#replica()
    endif
endfunction

" delete
function! php#easy#any#orchestrator#delete()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#entities#method#delete()
    elseif  l:itIs == 'constant'
        call php#easy#any#entities#constant#delete()
    elseif  l:itIs == 'property'
        call php#easy#any#entities#property#delete()
    endif
endfunction

" phpdoc
function! php#easy#any#orchestrator#doc()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#entities#method#doc()
    elseif  l:itIs == 'constant'
        call php#easy#any#entities#constant#doc()
    elseif  l:itIs == 'property'
        call php#easy#any#entities#property#doc()
    elseif  l:itIs == 'variable'
        call php#easy#any#entities#variable#doc()
    endif
endfunction
