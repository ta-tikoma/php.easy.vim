"#####################################
"# KEYBINDING
"#####################################

let g:phpEasyUseDefaultKeyBinding = get(g:, 'phpEasyUseDefaultKeyBinding', 1)

if g:phpEasyUseDefaultKeyBinding
    " any
    " nnoremap -y   :call php#easy#any#orchestrator#copy()<CR>
    nnoremap -r   :call php#easy#any#orchestrator#replica()<CR>
    nnoremap -d   :call php#easy#any#orchestrator#delete()<CR>
    nnoremap -b   :call php#easy#any#orchestrator#docBlock()<CR>

    " append
    nnoremap -c   :call php#easy#any#entities#method#append()<CR>
    nnoremap -p   :call php#easy#any#entities#method#append()<CR>
    nnoremap -m   :call php#easy#any#entities#method#append()<CR>
    " nnoremap -a   :call php#easy#argument#append()<CR>

    " argument
    " nmap -da :call php#easy#argument#delete()<CR>

    " di
    nnoremap -di  :call php#easy#di#append()<CR>

    " init object
    nnoremap -ic  :call php#easy#any#entities#object#class()<CR>
    nnoremap -ii  :call php#easy#any#entities#object#interface()<CR>
    nnoremap -iac :call php#easy#any#entities#object#abstractClass()<CR>
    nnoremap -it  :call php#easy#any#entities#object#trait()<CR>

    " other
    " nmap -l :call php#easy#other#log()<CR>
    " nmap -pp :call php#easy#other#changeVisibility()<CR>

    " navigation
    " nmap <tab> :call php#easy#navigation#next()<CR>
    " nmap <S-tab> :call php#easy#navigation#prev()<CR>
endif

augroup php_easy_insert_end
    autocmd!
    autocmd InsertLeave *.php call php#easy#helpers#insert#end()
augroup END
