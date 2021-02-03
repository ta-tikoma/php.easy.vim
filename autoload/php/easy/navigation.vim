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

function! php#easy#navigation#methodPrev()
    call search("^    \\(private\\|public\\|protected\\) function", 'bw')
    normal! zz
endfunction

function! php#easy#navigation#methodNext()
    call search("^    \\(private\\|public\\|protected\\) function", 'w')
    normal! zz
endfunction

function! php#easy#navigation#propertyPrev()
    call search("^    \\(private\\|public\\|protected\\) \\$", 'bw')
    normal! zz
endfunction

function! php#easy#navigation#propertyNext()
    call search("^    \\(private\\|public\\|protected\\) \\$", 'w')
    normal! zz
endfunction
