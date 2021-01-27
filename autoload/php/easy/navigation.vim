" go to prev end or begin function and class properties
function! php#easy#navigation#prev()
    silent ?^    p
    normal! zz
    
    silent! call repeat#set(":call PhpPrev()\<CR>", v:count)
endfunction

" got to next end or begin function and class properties
function! php#easy#navigation#next()
    silent /^    p
    normal! zz

    silent! call repeat#set(":call PhpNext()\<CR>", v:count)
endfunction
