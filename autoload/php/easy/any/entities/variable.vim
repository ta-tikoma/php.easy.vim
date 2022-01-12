" doc variable
function! php#easy#any#entities#variable#doc()
    let l:line = getline(".")
    let l:variable = matchstr(l:line, '\(\$\w\+\)')
    let l:matches = matchlist(l:line, '\(\w\+\)::')

    if len(l:matches) > 1
        let l:type = l:matches[1]
    else
        let l:type = ''
    endif

    exec 'normal! O/** @var ' . l:type . ' ' . l:variable . ' */'

    if len(l:matches) < 1
        normal! ^fr2l
        startinsert
    endif
endfunction
