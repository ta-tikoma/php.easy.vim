" doc variable
function! php#easy#any#entities#object#doc()
    let @p = "/**\n * \n */\n"
    normal "pPj
    startinsert!
endfunction

" init class
function! php#easy#any#entities#object#class()
    call s:PhpObject("final class")
endfunction

" init abstract class
function! php#easy#any#entities#object#abstractClass()
    call s:PhpObject("abstract class")
endfunction

" init interface
function! php#easy#any#entities#object#interface()
    call s:PhpObject("interface")
endfunction

" init trait
function! php#easy#any#entities#object#trait()
    call s:PhpObject("trait")
endfunction

function! s:PhpObject(type)
    let l:file = expand('%:t:r') 
    let l:path = fnamemodify(expand("%:p:h"), ":~:.")

    let l:composerPath = getcwd() . '/composer.json'
    if filereadable(l:composerPath)
        let l:composer = readfile(l:composerPath)
        let l:psr4 = {}
        let l:is_psr4 = 0
        for l:line in l:composer
            if l:line == '        }'
                let l:is_psr4 = 0
            endif

            if l:is_psr4
                let l:line = trim(l:line)
                let l:parts = split(l:line, ':')
                let l:psr4[trim(l:parts[0], " \"\,\\")] = trim(l:parts[1], " \"\,\/")
            endif

            if l:line == '        "psr-4": {'
                let l:is_psr4 = 1
            endif
        endfor

        if !empty(l:psr4)
            for key in keys(l:psr4)
                let l:path = substitute(l:path, l:psr4[key], key, 'g') 
            endfor
        endif
    endif

    let l:path = substitute(l:path, '/', '\', 'g') 

    let l:namespaceBegin = search("^namespace ", "w")

    if l:namespaceBegin == 0
        exec "normal! i<?php\<CR>\<CR>declare(strict_types=1);\<CR>\<CR>namespace " . l:path . ";\<CR>\<CR>" . a:type . " " . l:file . "\<CR>{\<CR>}"
        let className = search(a:type . " " . file, "e")
    else
        exec "normal! Cnamespace " . path . ";"
        let l:objectBegin = search(g:php#easy#any#regex#object, "we")
        exec "normal! lcw" . file
    endif
endfunction
