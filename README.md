# Php Easy Vim

A few functions for make work with PHP projects easy and quickly.

# Install

```vim
Plug 'ta-tikoma/php.easy.vim'
```

# Some settings

## If you want make self key binding

```vim
let g:phpEasyUseDefaultKeyBinding = 0
```

## If you need check stack fucntions of php#easy

```vim
php#easy#insert#is()
```

# Features

| Default Key Binding | Function | Description | Done |
| --- | --- | --- | --- |
| **Any**           |                                           | function or property or constant | |
| `<C-p>y`          | `php#easy#any#copy`                       | **Y**ank (copy) *any* under cursor | |
| `<C-p>r`          | `php#easy#any#replica`                    | **R**eplica *any*: Copy under cursor, paste after current and trigger rename function | |
| `<C-p>d`          | `php#easy#any#delete`                     | **D**elete *any* under cursor | |
| **Constants**     |||
| `<C-p>c`          | `php#easy#constant#append()`              | **A**ppend **c**onstant | ✅ |
| **Function**      |||
|                   | `php#easy#function#foreach()`             | **A**ppend **f**oreach | ✅ |
|                   | `php#easy#function#if()`                  | **A**ppend **i**f | ✅ |
|                   | `php#easy#function#else()`                | **A**ppend **e**lse | ✅ |
|                   | `php#easy#function#switch`                | **A**ppend **s**wich | ✅ |
| **Method**        |||
| `<C-p>m`          | `php#easy#method#append()`                | **A**ppend new **m**ethod after current function | ✅ |
| `<C-p>M`          | `php#easy#method#prepend()`               | **P**reppend new **m**ethod before current function | ✅ |
| `<C-p>sm`         |                                           | **A**ppend new **s**tatic **m**ethod after current function | |
|                   | `php#easy#method#copy()`                  | **Y**ank (copy) **m**ethod under cursor | ✅ |
|                   | `php#easy#method#replica()`               | **R**eplica **m**ethod: Copy function under cursor, paste after current and trigger rename function | ✅ |
|                   | `php#easy#method#delete()`                | **D**elete **m**ethod under cursor | ✅ |
|                   | `php#easy#method#rename()`                | **R**e**n**ame **m**ethod under cursor | ✅ |
| **Argument**      |||
| `<C-p>a`          | `php#easy#argument#append()`              | **A**ppend new **a**rgument in current function | ✅ |
| `<C-p>da{1-4}`    | `php#easy#argument#delete()`              | **D**elete **a**rgument by number in current function | ✅ |
| `<C-p>ca{1-4}`    |                                           | Change argament by number in current function | |
| `<C-p>cat{1-4}`   |                                           | Change argument type by number in current function | |
| **Property**      |||
| `<C-p>p`          | `php#easy#property#append("private")`     | **A**ppend private **p**roperty to current class. *You can use `.` for add another property if install [vim-repeat](https://github.com/tpope/vim-repeat)* | ✅ |
| `<C-p>P`          | `php#easy#property#append("public")`      | **A**ppend public **p**roperty to current class | ✅ |
| `<C-p>sp`         |                                           | **A**ppend public **s**tatic **p**roperty to current class |  |
|                   |                                           | Delete property under cursor | |
|                   |                                           | Copy property under cursor | |
|                   |                                           | Copy property under cursor and paste after | |
| **DI**            |||
| `<C-p>di`         | `php#easy#di#append()`                    | **A**ppend **d**epended **i**njection: add constructor to current class (if not exist), append argument and property | ✅ |
| **Objects**       |||
| `<C-p>ic`         | `php#easy#object#class()`                 | **I**nitialize **c**lass in current file | ✅ |
| `<C-p>iac`        | `php#easy#object#abstractClass()`         | **I**nitialize **a**bstract **c**lass in current file | ✅ |
| `<C-p>ii`         | `php#easy#object#interface()`             | **I**nitialize **i**nterface in current file | ✅ |
| `<C-p>it`         | `php#easy#object#trait()`                 | **I**nitialize **t**rait in current file | ✅ |
| **Other**         |||
| `<C-p>l`          | `php#easy#other#log()`                    | Append on new line print structure for debug | ✅ |
| `<C-p>v`          | `php#easy#other#changeVisibility()`       | Change **v**isibiliti property or function on current line *(Can use `.`)* | ✅ |
| `<C-p><C-p>`      | `php#easy#other#doc()`                    | **A**dd **d**oc-block before current function or property | ✅ |
|                   | `php#easy#other#space()`                  | Append space after this line | ✅ |
| **Navigation**    |||
|                   | `php#easy#navigation#next()`              | Jump to next method or property | ✅ |
|                   | `php#easy#navigation#prev()`              | Jump to next method or property | ✅ |
| `=`               | `php#easy#navigation#methodNext()`        | Jump to next method | ✅ |
| `-`               | `php#easy#navigation#methodPrev()`        | Jump to prev method | ✅ |
| `+`               | `php#easy#navigation#propertyNext()`      | Jump to next property | ✅ |
| `_`               | `php#easy#navigation#propertyPrev()`      | Jump to prev property | ✅ |

# Examples
