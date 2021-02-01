# Php Easy Vim

A few functions for make work with PHP projects easy and quickly.

# Install

```vim
Plug 'ta-tikoma/php.easy.vim'
```

# If you want make self key binding

```vim
let g:phpEasyUseDefaultKeyBinding = 0
```

# Features

| Default Key Binding | Function | Description | Done |
| --- | --- | --- | --- |
| **Function** |||
| `<C-p>f` | `php#easy#function#append()` | Append new function after current function | ✅ |
| `<C-p>F` | `php#easy#function#prepend()` | Append new function before current function | ✅ |
| `<C-p>yf` | `php#easy#function#copy()` | Copy function under cursor | ✅ |
| `<C-p>rf` | `php#easy#function#replica()` | Copy function under, paste after current and trigger rename function | ✅ |
| `<C-p>df` | `php#easy#function#delete()` | Delete function under cursor | ✅ |
| `<C-p>rnf` | `php#easy#function#rename()` | Rename function under cursor | ✅ |
| **Argument** |||
| `<C-p>a` | `php#easy#argument#append()` | Append new argument in current function | ✅ |
| `<C-p>da{1-4}` | `php#easy#argument#delete` | Delete argument by number in current function | ✅ |
| `<C-p>ca{number}` | | Change argament by number in current function | |
| `<C-p>cat{number}` | | Change argument type by number in current function | |
| **Property** |||
| `<C-p>p` | `php#easy#property#append("private")` | Append private property to current class. *You can use `.` for add another property if install [vim-repeat](https://github.com/tpope/vim-repeat)* | ✅ |
| `<C-p>P` | `php#easy#property#append("public")` | Append public property to current class | ✅ |
| `<C-p>dp` | | Delete property under cursor | |
| `<C-p>yp` | | Copy property under cursor | |
| `<C-p>rp` | | Copy property under cursor and paste after | |
| **DI** |||
| `<C-p>di` | `php#easy#di#append()` | Append constructor to current class (if not exist), append argument and property | ✅ |
| **Objects** |||
| `<C-p>ic` | `php#easy#object#class()` | Initialize class in current file | ✅ |
| `<C-p>iac` | `php#easy#object#abstractClass()` |  Initialize abstract class in current file | ✅ |
| `<C-p>ii` | `php#easy#object#interface()` | Initialize interface in current file | ✅ |
| **Other** |||
| `<C-p>l` | `php#easy#other#log()` | Append on new line print structure for debug | ✅ |
| `<C-p>v` | `php#easy#other#changeVisibility()` | Change visibiliti property or function on current line | ✅ |
| **Navigation** |||
| `=` | `php#easy#navigation#next` | Jump to next property or method | ✅ |
| `-` | `php#easy#navigation#prev` | Jump to prev property or method | ✅ |
