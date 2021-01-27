"#####################################
"# POSITION
"#####################################

function! php#easy#position#remember()
    let g:phpPosition = getpos(".")
endfunction

function! php#easy#position#restore()
    call setpos(".", g:phpPosition)
endfunction
