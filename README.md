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

## If you need check stack functions of php#easy

```vim
php#easy#helpers#insert#is()
```

# Features

| Default Key Binding | Function  | Description |
| --- | --- | --- |
| **Any**             |                                                | function or property or constant |
| `<C-p>y`            | `php#easy#any#orchestrator#copy`               | **Y**ank (copy) *any* under cursor |
| `<C-p>r`            | `php#easy#any#orchestrator#replica`            | **R**eplica *any*: Copy under cursor, paste after current and trigger rename function |
| `<C-p>d`            | `php#easy#any#orchestrator#delete`             | **D**elete *any* under cursor |
| `<C-p>8`            | `php#easy#any#orchestrator#doc`                | PhpDocBlock for *any* or class or variable |
| **Append**          |                                                | `{0-3}` it is visibility; 0 - nothing, 1 - private, 2 - protected, 3 - public |
| `<C-p>c{0-3}`       | `php#easy#any#entities#constant#append()`      | **A**ppend **c**onstant |
| `<C-p>p{0-3}`       | `php#easy#any#entities#property#append()`      | **A**ppend **p**roperty |
| `<C-p>m{0-3}`       | `php#easy#any#entities#method#append()`        | **A**ppend **m**ethod |
| `<C-p>a`            | `php#easy#argument#append()`                   | **A**ppend new **a**rgument in current function |
| **Argument**        |||
| `<C-p>da{d}`        | `php#easy#argument#delete()`                   | **D**elete **a**rgument by number in current function |
| **DI**              |||
| `<C-p>di`           | `php#easy#di#append()`                         | **A**ppend **d**epended **i**njection: add constructor to current class (if not exist), append argument and property |
| **Objects**         |||
| `<C-p>ic`           | `php#easy#any#entities#object#class()`         | **I**nitialize **c**lass in current file |
| `<C-p>iac`          | `php#easy#any#entities#object#abstractClass()` | **I**nitialize **a**bstract **c**lass in current file |
| `<C-p>ii`           | `php#easy#any#entities#object#interface()`     | **I**nitialize **i**nterface in current file |
| `<C-p>it`           | `php#easy#any#entities#object#trait()`         | **I**nitialize **t**rait in current file |
| **Other**           |||
| `<C-p>l`            | `php#easy#other#log()`                         | Append on new line print structure for debug |
| `<C-p>v{0-3}`       | `php#easy#other#changeVisibility()`            | Change **v**isibiliti property or function on current line |
| **Navigation**      |||
| `<tab>`             | `php#easy#navigation#next()`                   | Jump to next constant, property, start or end method |
| `<S-tab>`           | `php#easy#navigation#prev()`                   | Jump to prev constant, property, start or end method |

# Examples

## Init

### Init trait `<C-p>it`
![init trait](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/init/trait.gif)

### Init interface `<C-p>ii`
![init interface](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/init/interface.gif)

### Init abstract class `<C-p>iac`
![init abstract class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/init/abstract-class.gif)

### Init class `<C-p>ic`
![init class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/init/class.gif)

## Init class `<C-p>8`

### Class
![doc class](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/class.gif)

### Constant
![doc constant](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/constant.gif)

### Property
![doc property](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/property.gif)

### Method
![doc method](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/method.gif)

### Variable
![doc variable](https://raw.githubusercontent.com/ta-tikoma/php.easy.vim/main/example/variable.gif)
