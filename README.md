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

| Default Key Binding | Function (If has not method not avalible) | Description |
| --- | --- | --- |
| **Any**           |                                           | function or property or constant |
| `<C-p>y`          | `php#easy#any#copy`                       | **Y**ank (copy) *any* under cursor |
| `<C-p>r`          | `php#easy#any#replica`                    | **R**eplica *any*: Copy under cursor, paste after current and trigger rename function |
| `<C-p>d`          | `php#easy#any#delete`                     | **D**elete *any* under cursor | |
| `<C-p>8`          | `php#easy#any#doc`                        | Php**D**ocBlock for *any* under cursor | |
| **Constants**     |||
| `<C-p>c`          | `php#easy#constant#append()`              | **A**ppend **c**onstant |
| **Argument**      |||
| `<C-p>a`          | `php#easy#argument#append()`              | **A**ppend new **a**rgument in current function |
| `<C-p>da{1-4}`    | `php#easy#argument#delete()`              | **D**elete **a**rgument by number in current function |
|                   |                                           | Change argament by number in current function |
|                   |                                           | Change argument type by number in current function |
| **Property**      |||
| `<C-p>p`          | `php#easy#property#append("private")`     | **A**ppend private **p**roperty to current class. *You can use `.` for add another property if install [vim-repeat](https://github.com/tpope/vim-repeat)* |
| `<C-p>P`          | `php#easy#property#append("public")`      | **A**ppend public **p**roperty to current class |
| **DI**            |||
| `<C-p>di`         | `php#easy#di#append()`                    | **A**ppend **d**epended **i**njection: add constructor to current class (if not exist), append argument and property |
| **Objects**       |||
| `<C-p>ic`         | `php#easy#object#class()`                 | **I**nitialize **c**lass in current file |
| `<C-p>iac`        | `php#easy#object#abstractClass()`         | **I**nitialize **a**bstract **c**lass in current file |
| `<C-p>ii`         | `php#easy#object#interface()`             | **I**nitialize **i**nterface in current file |
| `<C-p>it`         | `php#easy#object#trait()`                 | **I**nitialize **t**rait in current file |
| **Other**         |||
| `<C-p>l`          | `php#easy#other#log()`                    | Append on new line print structure for debug |
| `<C-p>v`          | `php#easy#other#changeVisibility()`       | Change **v**isibiliti property or function on current line *(Can use `.`)* |
|                   | `php#easy#other#space()`                  | Append space after this line |
| **Navigation**    |||
|                   | `php#easy#navigation#next()`              | Jump to next method or property |
|                   | `php#easy#navigation#prev()`              | Jump to next method or property |
| `=`               | `php#easy#navigation#methodNext()`        | Jump to next method |
| `-`               | `php#easy#navigation#methodPrev()`        | Jump to prev method |
| `+`               | `php#easy#navigation#propertyNext()`      | Jump to next property |
| `_`               | `php#easy#navigation#propertyPrev()`      | Jump to prev property |

# Examples

## Init class `<C-p>ic`

![init class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/c-p-ic.gif)

## Add private property `<C-p>p`

![add private property](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/c-p-p.gif)

## Add depended injection `<C-p>di`

![add depended injection ](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/c-p-di.gif)

## Replicate function `<C-p>r`

![replicate function](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/c-p-r.gif)

## Delete function `<C-p>d`

![delete function](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/c-p-d.gif)
