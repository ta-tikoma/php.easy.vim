let g:php#easy#any#regex#constant = '^    \(public\|protected\|private\|\) const '
let g:php#easy#any#regex#property = '^    \(public\|protected\|private\)\(\s?*\w\+\|\) \$'
let g:php#easy#any#regex#method = '^    \(private\|public\|protected\) function'
let g:php#easy#any#regex#methodEnd = '^\s\{4}}'
let g:php#easy#any#regex#comment = '^\s\{4}\/'
let g:php#easy#any#regex#commentEnd = '^\s\{5}\*'
