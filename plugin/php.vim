"#####################################
"# KEYBINDING
"#####################################

let g:phpEasyUseDefaultKeyBinding = get(g:, 'phpEasyUseDefaultKeyBinding', 1)

if g:phpEasyUseDefaultKeyBinding
    " any
    nmap <C-p>y :call php#easy#any#copy()<CR>
    nmap <C-p>r :call php#easy#any#replica()<CR>
    nmap <C-p>d :call php#easy#any#delete()<CR>
    nmap <C-p>8 :call php#easy#any#doc()<CR>

    " append
    nmap <C-p>c0 :call php#easy#constant#append("")<CR>
    nmap <C-p>c1 :call php#easy#constant#append("private")<CR>
    nmap <C-p>c2 :call php#easy#constant#append("protected")<CR>
    nmap <C-p>c3 :call php#easy#constant#append("public")<CR>

    nmap <C-p>p0 :call php#easy#property#append("")<CR>
    nmap <C-p>p1 :call php#easy#property#append("private")<CR>
    nmap <C-p>p2 :call php#easy#property#append("protected")<CR>
    nmap <C-p>p3 :call php#easy#property#append("public")<CR>

    nmap <C-p>m0 :call php#easy#method#append("")<CR>
    nmap <C-p>m1 :call php#easy#method#append("private")<CR>
    nmap <C-p>m2 :call php#easy#method#append("protected")<CR>
    nmap <C-p>m3 :call php#easy#method#append("public")<CR>

    nmap <C-p>a :call php#easy#argument#append()<CR>

    " argument
    nmap <C-p>da1 :call php#easy#argument#delete(1)<CR>
    nmap <C-p>da2 :call php#easy#argument#delete(2)<CR>
    nmap <C-p>da3 :call php#easy#argument#delete(3)<CR>
    nmap <C-p>da4 :call php#easy#argument#delete(4)<CR>

    " di
    nmap <C-p>di :call php#easy#di#append()<CR>

    " init object
    nmap <C-p>ic :call php#easy#object#class()<CR>
    nmap <C-p>iac :call php#easy#object#abstractClass()<CR>
    nmap <C-p>ii :call php#easy#object#interface()<CR>
    nmap <C-p>it :call php#easy#object#trait()<CR>

    " other
    nmap <C-p>l :call php#easy#other#log()<CR>
    nmap <C-p>v0 :call php#easy#other#changeVisibility('')<CR>
    nmap <C-p>v1 :call php#easy#other#changeVisibility('private')<CR>
    nmap <C-p>v2 :call php#easy#other#changeVisibility('protected')<CR>
    nmap <C-p>v3 :call php#easy#other#changeVisibility('public')<CR>

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
