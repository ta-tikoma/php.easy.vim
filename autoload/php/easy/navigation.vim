" go to prev end or begin function and class properties
function! php#easy#navigation#prev()
    silent ?^    p
    normal! zz
endfunction

" got to next end or begin function and class properties
function! php#easy#navigation#next()
    silent /^    p
    normal! zz
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
