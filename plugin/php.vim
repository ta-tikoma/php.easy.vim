"#####################################
"# KEYBINDING
"#####################################

let g:phpEasyUseDefaultKeyBinding = get(g:, 'phpEasyUseDefaultKeyBinding', 1)

if g:phpEasyUseDefaultKeyBinding
    " any
    nmap <C-p>y :call php#easy#any#orchestrator#copy()<CR>
    nmap <C-p>r :call php#easy#any#orchestrator#replica()<CR>
    nmap <C-p>d :call php#easy#any#orchestrator#delete()<CR>
    nmap <C-p>8 :call php#easy#any#orchestrator#doc()<CR>

    " append
    nmap <C-p>c :call php#easy#any#entities#constant#append()<CR>
    nmap <C-p>p :call php#easy#any#entities#property#append()<CR>
    nmap <C-p>m :call php#easy#any#entities#method#append()<CR>

    nmap <C-p>a :call php#easy#argument#append()<CR>

    " argument
    nmap <C-p>da :call php#easy#argument#delete()<CR>

    " di
    nmap <C-p>di :call php#easy#di#append()<CR>

    " init object
    nmap <C-p>ic :call php#easy#any#entities#object#class()<CR>
    nmap <C-p>iac :call php#easy#any#entities#object#abstractClass()<CR>
    nmap <C-p>ii :call php#easy#any#entities#object#interface()<CR>
    nmap <C-p>it :call php#easy#any#entities#object#trait()<CR>

    " other
    nmap <C-p>l :call php#easy#other#log()<CR>
    nmap <C-p>v :call php#easy#other#changeVisibility()<CR>

    " navigation
    nmap <tab> :call php#easy#navigation#next()<CR>
    nmap <S-tab> :call php#easy#navigation#prev()<CR>
endif

augroup php_easy_insert_end
    autocmd!
    autocmd InsertLeave *.php call php#easy#helpers#insert#end()
augroup END
