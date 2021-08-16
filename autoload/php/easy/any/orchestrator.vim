function! php#easy#any#orchestrator#itIs(patterns)
    let l:patterns = {
        \ g:php#easy#any#regex#method: 'method',
        \ g:php#easy#any#regex#methodEnd: 'method',
        \ g:php#easy#any#regex#constant: 'constant', 
        \ g:php#easy#any#regex#property: 'property',
        \ g:php#easy#any#regex#variable: 'variable',
        \ g:php#easy#any#regex#object: 'object'
        \ }

    " if we on docblock go to end
    if match(getline('.'), g:php#easy#any#regex#commentMiddle) != -1
        call search(g:php#easy#any#regex#commentEnd)
    endif

    " only from argument
    for [l:regex, l:name] in items(l:patterns)
        if index(a:patterns, l:name) == -1
            call remove(l:patterns, l:regex)
        endif
    endfor

    let l:positions = {}
    let l:curPostiion = line('.')

    " echom line('.')

    " find positions
    for [l:regex, l:name] in items(l:patterns)
        " down
        let l:position = search(l:regex, 'cnW')
        if l:position != 0
            " echom 'position:' . l:position . ' regex:' . l:regex
            let l:positions[abs(l:position - l:curPostiion)] = {
                \ 'name': l:name,
                \ 'position': l:position,
                \ 'regex': l:regex,
                \ 'to': 'down'
                \ }
        endif
        " up
        let l:position = search(l:regex, 'bcnW')
        if l:position != 0
            " echom 'position:' . l:position . ' regex:' . l:regex
            let l:positions[abs(l:position - l:curPostiion)] = {
                \ 'name': l:name,
                \ 'position': l:position,
                \ 'regex': l:regex,
                \ 'to': 'up'
                \ }
        endif
    endfor

    " echom 'FINAL'
    " echo l:positions
    let l:result = l:positions[min(keys(l:positions))]

    call cursor(l:result['position'], 0)

    return l:result['name']
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
function! php#easy#any#orchestrator#docBlock()
    let l:itIs = php#easy#any#orchestrator#itIs(['method', 'constant', 'property', 'variable', 'object'])
    exec 'call php#easy#any#entities#' . l:itIs . '#doc()'
endfunction
