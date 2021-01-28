# Php Easy Vim

A few functions for make work with PHP projects easy and quickly.

# Install

```
Plug 'ta-tikoma/php.easy.vim'
```

# If you want make self key binding

```
let g:phpEasyUseDefaultKeyBinding = 0
```

# Features

| Default Key Binding | Function | Description | Done |
| --- | --- | --- | --- |
| **Function** |||
| `<C-p>f` | `php#easy#function#append()` | Append new function after current function | [x] |
| `<C-p>F` | `php#easy#function#prepend()` | Append new function before current function | [x] |
| `<C-p>yf` | `php#easy#function#copy()` | Copy function under cursor | [x] |
| `<C-p>ypf` | `php#easy#function#duplicate()` | Copy function under, paste after current and trigger rename function | [x] |
| `<C-p>df` | `php#easy#function#delete()` | Delete function under cursor | [x] |
| `<C-p>rf` | `php#easy#function#rename()` | Rename function under cursor | [x] |
| **Argument** |||
| `<C-p>a` | `php#easy#argument#append()` | Append new argument in current function | [x] |
| `<C-p>da{number}` | | Delete argument by number in current function | [  ] |
| `<C-p>ca{number}` | | Change argament by number in current function | [  ] |
| `<C-p>cat{number}` | | Change argument type by number in current function | [  ] |
| **Property** |||
| `<C-p>p` | `php#easy#property#append("private")` | Append private property to current class. *You can use `.` for add another property if install [vim-repeat](https://github.com/tpope/vim-repeat)* | [x] |
| `<C-p>P` | `php#easy#property#append("public")` | Append public property to current class | [x] |
| **DI** |||
| `<C-p>di` | `php#easy#di#append` | Append constructor to current class (if not exist), append argument and property | [x] |
| **Objects** |||
| `<C-p>ic` | `php#easy#object#class` | Initialize class in current file | [x] |
| `<C-p>iac` | `php#easy#object#abstractClass` |  Initialize abstract class in current file | [x] |
| `<C-p>ii` | `php#easy#object#interface` | Initialize interface in current file | [x] |
| **Other** |||
| `<C-p>l` | `php#easy#other#log` | Append on new line print structure for debug | [x] |
| `<C-p>v` | `php#easy#other#changeVisibility` | Change visibiliti property or function on current line | [x] |
| **Navigation** |||
| | `php#easy#navigation#next` | Jump to next property or method | [x] |
| | `php#easy#navigation#prev` | Jump to prev property or method | [x] |
