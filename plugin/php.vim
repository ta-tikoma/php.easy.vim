"#####################################
"# KEYBINDING
"#####################################

let g:phpEasyUseDefaultKeyBinding = get(g:, 'phpEasyUseDefaultKeyBinding', 1)

if g:phpEasyUseDefaultKeyBinding
    " any
    nmap <C-p><C-y> :call php#easy#any#orchestrator#copy()<CR>
    nmap <C-p><C-r> :call php#easy#any#orchestrator#replica()<CR>
    nmap <C-p><C-d> :call php#easy#any#orchestrator#delete()<CR>
    nmap <C-p><C-b> :call php#easy#any#orchestrator#docBlock()<CR>

    " append
    nmap <C-p><C-c> :call php#easy#any#entities#constant#append()<CR>
    nmap <C-p><C-p> :call php#easy#any#entities#property#append()<CR>
    nmap <C-p><C-m> :call php#easy#any#entities#method#append()<CR>

    nmap <C-p><C-a> :call php#easy#argument#append()<CR>

    " argument
    nmap <C-p><C-d><C-a> :call php#easy#argument#delete()<CR>

    " di
    nmap <C-p><C-d><C-i> :call php#easy#di#append()<CR>

    " init object
    nmap <C-p><C-i><C-c> :call php#easy#any#entities#object#class()<CR>
    nmap <C-p><C-i><C-a><C-c> :call php#easy#any#entities#object#abstractClass()<CR>
    nmap <C-p><C-i><C-i> :call php#easy#any#entities#object#interface()<CR>
    nmap <C-p><C-i><C-t> :call php#easy#any#entities#object#trait()<CR>

    " other
    nmap <C-p><C-l> :call php#easy#other#log()<CR>
    " nmap <C-p><C-p> :call php#easy#other#changeVisibility()<CR>

    " navigation
    nmap <tab> :call php#easy#navigation#next()<CR>
    nmap <S-tab> :call php#easy#navigation#prev()<CR>
endif

augroup php_easy_insert_end
    autocmd!
    autocmd InsertLeave *.php call php#easy#helpers#insert#end()
augroup END
