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
| **Constants**     |||
| `<C-p>ac`         | | **A**ppend **c**onstant | |
| **Function**      |||
| `<C-p>af`         | `php#easy#function#foreach()`             | **A**ppend **f**oreach | ✅ |
| `<C-p>ai`         | `php#easy#function#if()`                  | **A**ppend **i**f | ✅ |
| `<C-p>ae`         | `php#easy#function#else()`                | **A**ppend **e**lse | ✅ |
| `<C-p>as`         | `php#easy#function#switch`                | **A**ppend **s**wich | ✅ |
| **Method**        |||
| `<C-p>am`         | `php#easy#method#append()`                | **A**ppend new **m**ethod after current function | ✅ |
| `<C-p>pm`         | `php#easy#method#prepend()`               | **P**reppend new **m**ethod before current function | ✅ |
| `<C-p>ym`         | `php#easy#method#copy()`                  | **Y**ank (copy) **m**ethod under cursor | ✅ |
| `<C-p>rm`         | `php#easy#method#replica()`               | **R**eplica **m**ethod: Copy function under cursor, paste after current and trigger rename function | ✅ |
| `<C-p>dm`         | `php#easy#method#delete()`                | **D**elete **m**ethod under cursor | ✅ |
| `<C-p>rnm`        | `php#easy#method#rename()`                | **R**e**n**ame **m**ethod under cursor | ✅ |
| **Argument**      |||
| `<C-p>aa`         | `php#easy#argument#append()`              | **A**ppend new **a**rgument in current function | ✅ |
| `<C-p>da{1-4}`    | `php#easy#argument#delete()`              | **D**elete **a**rgument by number in current function | ✅ |
| `<C-p>ca{1-4}`    | | Change argament by number in current function | |
| `<C-p>cat{1-4}`   | | Change argument type by number in current function | |
| **Property**      |||
| `<C-p>ap`         | `php#easy#property#append("private")`     | **A**ppend private **p**roperty to current class. *You can use `.` for add another property if install [vim-repeat](https://github.com/tpope/vim-repeat)* | ✅ |
| `<C-p>aP`         | `php#easy#property#append("public")`      | **A**ppend public **p**roperty to current class | ✅ |
| `<C-p>dp`         | | Delete property under cursor | |
| `<C-p>yp`         | | Copy property under cursor | |
| `<C-p>rp`         | | Copy property under cursor and paste after | |
| **DI**            |||
| `<C-p>adi`        | `php#easy#di#append()`                    | **A**ppend **d**epended **i**njection: add constructor to current class (if not exist), append argument and property | ✅ |
| **Objects**       |||
| `<C-p>ic`         | `php#easy#object#class()`                 | **I**nitialize **c**lass in current file | ✅ |
| `<C-p>iac`        | `php#easy#object#abstractClass()`         | **I**nitialize **a**bstract **c**lass in current file | ✅ |
| `<C-p>ii`         | `php#easy#object#interface()`             | **I**nitialize **i**nterface in current file | ✅ |
| **Other**         |||
| `<C-p>l`          | `php#easy#other#log()`                    | Append on new line print structure for debug | ✅ |
| `<C-p>v`          | `php#easy#other#changeVisibility()`       | Change **v**isibiliti property or function on current line *(Can use `.`)* | ✅ |
| `<C-p>ad`         | `php#easy#other#doc()`                    | **A**dd **d**oc-block before current function or property | ✅ |
| **Navigation**    |||
| `=`               | `php#easy#navigation#methodNext()`        | Jump to next method | ✅ |
| `-`               | `php#easy#navigation#methodPrev()`        | Jump to prev method | ✅ |
| `=`               | `php#easy#navigation#propertyNext()`      | Jump to next property | ✅ |
| `-`               | `php#easy#navigation#propertyPrev()`      | Jump to prev property | ✅ |

# Examples
