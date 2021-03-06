" init class
function! php#easy#object#class()
    call s:PhpObject("final class")
endfunction

" init abstract class
function! php#easy#object#abstractClass()
    call s:PhpObject("abstract class")
endfunction

" init interface
function! php#easy#object#interface()
    call s:PhpObject("interface")
endfunction

" init trait
function! php#easy#object#trait()
    call s:PhpObject("trait")
endfunction

function! s:PhpObject(type)
    let l:file = expand('%:t:r') 
    let l:path = substitute(fnamemodify(expand("%:p:h"), ":~:."), '/', '\', 'g') 

    let l:namespaceBegin = search("^namespace ", "w")

    if l:namespaceBegin == 0
        exec "normal! i<?php\<CR>\<CR>namespace " . l:path . ";\<CR>\<CR>" . a:type . " " . l:file . "\<CR>{\<CR>}"
        let className = search(a:type . " " . file, "e")
    else
        exec "normal! Cnamespace " . path . ";"
        let l:objectBegin = search("^\\(final class\\|abstract class\\|class\\|interface\\|trait\\) ", "we")
        exec "normal! lcw" . file
    endif
endfunction
