" go to prev end or begin function and class properties
function! php#easy#navigation#prev()
    silent ?^    p
    normal! zz
    
    silent! call repeat#set(":call php#easy#navigation#prev()\<CR>", v:count)
endfunction

" got to next end or begin function and class properties
function! php#easy#navigation#next()
    silent /^    p
    normal! zz

    silent! call repeat#set(":call php#easy#navigation#next()\<CR>", v:count)
endfunction
