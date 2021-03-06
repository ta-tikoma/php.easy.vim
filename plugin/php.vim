"#####################################
"# KEYBINDING
"#####################################

let g:phpEasyUseDefaultKeyBinding = get(g:, 'phpEasyUseDefaultKeyBinding', 1)

if g:phpEasyUseDefaultKeyBinding
    " any
    nmap <C-p>y :call php#easy#any#copy()<CR>
    nmap <C-p>r :call php#easy#any#replica()<CR>
    nmap <C-p>d :call php#easy#any#delete()<CR>

    " function
    nmap <C-p>c :call php#easy#constant#append()<CR>

    " method
    nmap <C-p>m :call php#easy#method#append()<CR>
    nmap <C-p>M :call php#easy#method#prepend()<CR>
    nmap <C-p>rnm :call php#easy#method#rename()<CR>

    " argument
    nmap <C-p>a :call php#easy#argument#append()<CR>
    nmap <C-p>da1 :call php#easy#argument#delete(1)<CR>
    nmap <C-p>da2 :call php#easy#argument#delete(2)<CR>
    nmap <C-p>da3 :call php#easy#argument#delete(3)<CR>
    nmap <C-p>da4 :call php#easy#argument#delete(4)<CR>
    " nmap <C-p>ca1 :call PhpChangeArgument(1)<CR>
    " nmap <C-p>cat1 :call PhpChangeArgumentType(1)<CR>

    " property
    nmap <C-p>p :call php#easy#property#append("private")<CR>
    nmap <C-p>P :call php#easy#property#append("public")<CR>

    " di
    nmap <C-p>di :call php#easy#di#append()<CR>

    " init object
    nmap <C-p>ic :call php#easy#object#class()<CR>
    nmap <C-p>iac :call php#easy#object#abstractClass()<CR>
    nmap <C-p>ii :call php#easy#object#interface()<CR>
    nmap <C-p>it :call php#easy#object#trait()<CR>

    " other
    nmap <C-p>l :call php#easy#other#log()<CR>
    nmap <C-p>v :call php#easy#other#changeVisibility()<CR>
    nmap <C-p><C-p> :call php#easy#other#doc()<CR>
    nmap <C-p><space> :call php#easy#other#space()<CR>

    " navigation
    " nmap = :call php#easy#navigation#methodNext()<CR>
    " nmap - :call php#easy#navigation#methodPrev()<CR>
    " nmap _ :call php#easy#navigation#propertyNext()<CR>
    " nmap + :call php#easy#navigation#propertyPrev()<CR>
endif

augroup php_easy_insert_end
    autocmd!
    autocmd InsertLeave *.php call php#easy#insert#end()
augroup END
