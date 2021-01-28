"#####################################
"# KEYBINDING
"#####################################

" nmap <A-j> :call php#easy#navigation#next()<CR>
" nmap <A-k> :call php#easy#navigation#prev()<CR>

nmap <C-p>f :call php#easy#function#append()<CR>
nmap <C-p>F :call php#easy#function#prepend()<CR>
nmap <C-p>yf :call php#easy#function#copy()<CR>
nmap <C-p>ypf :call php#easy#function#duplicate()<CR>
nmap <C-p>df :call php#easy#function#delete()<CR>
nmap <C-p>rf :call php#easy#function#rename()<CR>

nmap <C-p>a :call php#easy#argument#append()<CR>
" nmap <C-p>da1 :call PhpDeleteArgument(1)<CR>
" nmap <C-p>ca1 :call PhpChangeArgument(1)<CR>
" nmap <C-p>cat1 :call PhpChangeArgumentType(1)<CR>

nmap <C-p>p :call php#easy#property#append("private")<CR>
nmap <C-p>P :call php#easy#property#append("public")<CR>

nmap <C-p>di :call php#easy#di#append()<CR>

nmap <C-p>ic :call php#easy#object#class()<CR>
nmap <C-p>iac :call php#easy#object#abstractClass()<CR>
nmap <C-p>ii :call php#easy#object#interface()<CR>

nmap <C-p>l :call php#easy#other#log()<CR>
nmap <C-p>v :call php#easy#other#changeVisibility()<CR>

augroup php_easy_insert_end
    autocmd!
    autocmd InsertLeave *.php call php#easy#insert#end()
augroup END
