# Php Easy Vim

A few functions for make work with PHP 7.4 (or more) projects easy and quickly.

# Install

```vim
Plug 'ta-tikoma/php.easy.vim'
```

# Some settings

## If you want to make self key binding

```vim
let g:phpEasyUseDefaultKeyBinding = 0
```

## If you need check stack functions of php#easy

```vim
php#easy#helpers#insert#is()
```

# Features

| Default Key Binding | Function  | Description |
| --- | --- | --- |
| **Any**                   |                                                | function or property or constant |
| `<C-p><C-y>`              | `php#easy#any#orchestrator#copy`               | **Y**ank (copy) *any* under cursor |
| `<C-p><C-r>`              | `php#easy#any#orchestrator#replica`            | **R**eplica *any*: Copy under cursor, paste after current and trigger rename function |
| `<C-p><C-d>`              | `php#easy#any#orchestrator#delete`             | **D**elete *any* under cursor |
| `<C-p><C-b>`              | `php#easy#any#orchestrator#docBlock`           | PhpDoc**B**lock for *any* or class or variable |
| **Append**                |                                                | |
| `<C-p><C-c>`              | `php#easy#any#entities#constant#append()`      | **A**ppend **c**onstant |
| `<C-p><C-p>`              | `php#easy#any#entities#property#append()`      | **A**ppend **p**roperty |
| `<C-p><C-m>`              | `php#easy#any#entities#method#append()`        | **A**ppend **m**ethod |
| `<C-p><C-a>`              | `php#easy#argument#append()`                   | **A**ppend new **a**rgument in current function |
| **Argument**              |||
| `<C-p><C-d><C-a>(\d+)`    | `php#easy#argument#delete()`                   | **D**elete **a**rgument by number in current function |
| **DI**                    |||
| `<C-p><C-d><C-i>`         | `php#easy#di#append()`                         | **A**ppend **d**epended **i**njection: add constructor to current class (if not exist), append argument and property |
| **Objects**               |||
| `<C-p><C-i><C-c>`         | `php#easy#any#entities#object#class()`         | **I**nitialize **c**lass in current file |
| `<C-p><C-i><C-a><C-c>`    | `php#easy#any#entities#object#abstractClass()` | **I**nitialize **a**bstract **c**lass in current file |
| `<C-p><C-i><C-i>`         | `php#easy#any#entities#object#interface()`     | **I**nitialize **i**nterface in current file |
| `<C-p><C-i><C-t>`         | `php#easy#any#entities#object#trait()`         | **I**nitialize **t**rait in current file |
| **Other**                 |||
| `<C-p><C-l>`              | `php#easy#other#log()`                         | Append on new line print structure for debug |
| `<C-p><C-p>`              | `php#easy#other#changeVisibility()`            | Change **v**isibiliti property or function on current line |
| **Navigation**            |||
| `<tab>`                   | `php#easy#navigation#next()`                   | Jump to next constant, property, start or end method |
| `<S-tab>`                 | `php#easy#navigation#prev()`                   | Jump to prev constant, property, start or end method |

# Examples

## Init

### Init trait `<C-p><C-i><C-t>`
![init trait](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/trait.gif)

### Init interface `<C-p><C-i><C-i>`
![init interface](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/interface.gif)

### Init abstract class `<C-p><C-i><C-a><C-c>`
![init abstract class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/abstract-class.gif)

### Init class `<C-p><C-i><C-c>`
![init class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/class.gif)

## Add doc block `<C-p><C-b>`

### Class
![doc class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/doc/class.gif)

### Constant
![doc constant](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/doc/constant.gif)

### Property
![doc property](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/doc/property.gif)

### Method
![doc method](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/doc/method.gif)

### Variable
![doc variable](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/doc/variable.gif)
