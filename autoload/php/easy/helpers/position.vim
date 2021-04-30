"#####################################
"# POSITION
"#####################################

" remember position
function! php#easy#helpers#position#remember()
    normal! mp
endfunction

" restore position
function! php#easy#helpers#position#restore()
    normal! `p
endfunction
