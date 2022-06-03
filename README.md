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
| **Any**        |                                                | function or property or constant |
| `-y`           | `php#easy#any#orchestrator#copy`               | **Y**ank (copy) *any* under cursor |
| `-r`           | `php#easy#any#orchestrator#replica`            | **R**eplica *any*: Copy under cursor, paste after current and trigger rename function |
| `-d`           | `php#easy#any#orchestrator#delete`             | **D**elete *any* under cursor |
| `-b`           | `php#easy#any#orchestrator#docBlock`           | PhpDoc**B**lock for *any* or class or variable |
| **Append**     |                                                | |
| `-c`           | `php#easy#any#entities#constant#append()`      | Append **c**onstant |
| `-p`           | `php#easy#any#entities#property#append()`      | Append **p**roperty |
| `-m`           | `php#easy#any#entities#method#append()`        | Append **m**ethod |
| `-a`           | `php#easy#argument#append()`                   | Append new **a**rgument in current function |
| **Argument**   |||
| `-da`          | `php#easy#argument#delete()`                   | **D**elete **a**rgument by number in current function |
| **DI**         |||
| `-di`          | `php#easy#di#append()`                         | Append **d**epended **i**njection: add constructor to current class (if not exist), append argument and property |
| **Objects**    |||
| `-ic`          | `php#easy#any#entities#object#class()`         | **I**nitialize **c**lass in current file |
| `-iac`         | `php#easy#any#entities#object#abstractClass()` | **I**nitialize **a**bstract **c**lass in current file |
| `-ii`          | `php#easy#any#entities#object#interface()`     | **I**nitialize **i**nterface in current file |
| `-it`          | `php#easy#any#entities#object#trait()`         | **I**nitialize **t**rait in current file |
| **Other**      |||
|                | `php#easy#other#log()`                         | Append on new line print structure for debug |
|                | `php#easy#other#changeVisibility()`            | Change visibility property or function on current line |
| **Navigation** |||
|                | `php#easy#navigation#next()`                   | Jump to next constant, property, start or end method |
|                | `php#easy#navigation#prev()`                   | Jump to prev constant, property, start or end method |

# Examples

## Init

### Init trait `-it`
![init trait](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/trait.gif)

### Init interface `-ii`
![init interface](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/interface.gif)

### Init abstract class `-iac`
![init abstract class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/abstract-class.gif)

### Init class `-ic`
![init class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/with-examples/example/init/class.gif)

## Add doc block `-b`

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
