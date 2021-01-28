"#####################################
"# POSITION
"#####################################

" remember position
function! php#easy#position#remember()
    let g:phpEasyPosition = getpos(".")
endfunction

" check saved position with current
function! php#easy#position#ifBelowAppendLines(countLines)
    let l:currentPosition = getpos(".")

    if g:phpEasyPosition[1] > l:currentPosition[1]
        let g:phpEasyPosition[1] = g:phpEasyPosition[1] + a:countLines
    endif
endfunction

" restore position
function! php#easy#position#restore()
    call setpos(".", g:phpEasyPosition)
endfunction
