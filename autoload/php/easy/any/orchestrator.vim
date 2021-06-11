function! php#easy#any#orchestrator#itIs(patterns)
    normal! k

    let l:patterns = {'method': g:php#easy#any#regex#methodEnd, 'constant': g:php#easy#any#regex#constant, 'property': g:php#easy#any#regex#property, 'variable': g:php#easy#any#regex#variable, 'object': g:php#easy#any#regex#object}

    " if we on docblock go to end
    if match(getline("."), g:php#easy#any#regex#commentMiddle) != -1
        call search(g:php#easy#any#regex#commentEnd)
    endif

    " only from argument
    for [key, value] in items(l:patterns)
        if index(a:patterns, key) == -1
            call remove(l:patterns, key)
        endif
    endfor

    let l:positions = {}

    " find positions
    for [key, value] in items(l:patterns)
        let l:position = search(value, 'nW')
        if l:position != 0
            let l:positions[key] = l:position
        endif
    endfor

    let l:minPosition = min(values(l:positions))

    " who has min position
    for [key, value] in items(l:positions)
        if l:minPosition == value
            return key
        endif
    endfor
endfunction

" copy
function! php#easy#any#orchestrator#copy()
    let l:itIs = php#easy#any#orchestrator#itIs(['method', 'constant', 'property'])
    exec 'call php#easy#any#entities#' . l:itIs . '#copy()'
endfunction

" replica
function! php#easy#any#orchestrator#replica()
    let l:itIs = php#easy#any#orchestrator#itIs(['method', 'constant', 'property'])
    exec 'call php#easy#any#entities#' . l:itIs . '#replica()'
endfunction

" delete
function! php#easy#any#orchestrator#delete()
    let l:itIs = php#easy#any#orchestrator#itIs(['method', 'constant', 'property'])
    exec 'call php#easy#any#entities#' . l:itIs . '#delete()'
endfunction

" phpdoc
function! php#easy#any#orchestrator#doc()
    let l:itIs = php#easy#any#orchestrator#itIs(['method', 'constant', 'property', 'variable', 'object'])
    exec 'call php#easy#any#entities#' . l:itIs . '#doc()'
endfunction
