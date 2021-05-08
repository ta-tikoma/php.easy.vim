function! php#easy#any#orchestrator#itIs()
    normal! k

    let l:positions = []

    let l:method = search("^    }", 'nW')
    if l:method != 0
        call add(l:positions, l:method)
    endif

    let l:constant = search(g:php#easy#any#constant#regex, 'nW')
    if l:constant != 0
        call add(l:positions, l:constant)
    endif

    let l:property = search(g:php#easy#any#property#regex, 'nW')
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
function! php#easy#any#orchestrator#copy()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#method#copy()
    elseif  l:itIs == 'constant'
        call php#easy#any#constant#copy()
    elseif  l:itIs == 'property'
        call php#easy#any#property#copy()
    endif
endfunction

" replica
function! php#easy#any#orchestrator#replica()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#method#replica()
    elseif  l:itIs == 'constant'
        call php#easy#any#constant#replica()
    elseif  l:itIs == 'property'
        call php#easy#any#property#replica()
    endif
endfunction

" delete
function! php#easy#any#orchestrator#delete()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#method#delete()
    elseif  l:itIs == 'constant'
        call php#easy#any#constant#delete()
    elseif  l:itIs == 'property'
        call php#easy#any#property#delete()
    endif
endfunction

" phpdoc
function! php#easy#any#orchestrator#doc()
    let l:itIs = php#easy#any#orchestrator#itIs()

    if l:itIs == 'method'
        call php#easy#any#method#doc()
    elseif  l:itIs == 'constant'
        call php#easy#any#constant#doc()
    elseif  l:itIs == 'property'
        call php#easy#any#property#doc()
    endif
endfunction
