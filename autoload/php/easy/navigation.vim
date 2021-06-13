" go to prev end or begin function and class properties
function! php#easy#navigation#prev()
    call search(g:php#easy#any#regex#any, 'bw')
endfunction

" got to next end or begin function and class properties
function! php#easy#navigation#next()
    call search(g:php#easy#any#regex#any, 'w')
endfunction

function! php#easy#navigation#methodPrev()
    call search(g:php#easy#any#regex#method, 'bw')
    normal! zz
endfunction

function! php#easy#navigation#methodNext()
    call search(g:php#easy#any#regex#method, 'w')
    normal! zz
endfunction

function! php#easy#navigation#propertyPrev()
    call search(g:php#easy#any#regex#property, 'bw')
    normal! zz
endfunction

function! php#easy#navigation#propertyNext()
    call search(g:php#easy#any#regex#property, 'w')
    normal! zz
endfunction
