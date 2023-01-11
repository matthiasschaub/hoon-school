# Lesson 2

Irregular syntax, Hoon structures (`mold`) and hoon programs (`generators`).

## Terminology

gate
: are deferred computations (function)
: takes one or more arguments and returns a value
: structurally gates consists of a `spec` (input specification) and a `hoon` (body)
: `|=` bartis

spec
: the input specification
: it gives the type as a mold and attaches a face to it
: the input value is called a `sample`

referential transparency
: output value of a functions depends solely upon input value(s)

mark
: transformation rule for data (files types)

mold
: defines Hoon structures (cells, lists, sets)
: they have a default value ("bunt") and are strictly statically typed (e.e. they must match)

fence
: a way of making sure only data matching the appropriate structure get passed on (enforce type constraint)
: `|=  a=@ud  ^-  @ud`

statically typed
: enforce type constraints

list
: a running cell which terminates in a `~` (null) atom
: null terminated tuple
: `[1 2 3 ~]`
: irregular syntax: `~[1 2 3]`

cord
: text or string
: `'with single quotes'`
: `@t`

tape
: text or string
: list of individual characters
: `'with double quotes"`

generator
: Hoon program
: naked generators having access only to information passed to them directly in their `sample`

## Runes

`::`
: Comment

`:-`
: colhep construct a cell (2-tuple).
: irregular syntax `[1  3]`

`:^`
: colket construct a quadruple (4-tuple).

`%-`
: cenhep slams a gate (calls a function)
: irregular syntax `(add 1 3)`

`^-`
: kethep casts by explicit type label.
: enforces type constrain
: irregular syntax: ```@ux`5.5``

`|=`
: bartis produces a gate (function)
: `|=  [a=@ b=@]  %-  add   :-  a  b`

`?:`
: wutcol branches on a boolean test
: `?:((gth 1 0) 3 4)`

`/+`
: faslus loads a library
: import the contents of a file in the `/lib` directory

## Concepts

### Regular (Tall and Wide) and Irregular Forms

In tall mode, each rune and subexpression must be separated by a `gap` (tow or more spaces, or a line break).

In wide form the rune is immediately followed by parentheses `( )`, and the various subexpressions inside the parentheses must be separated from the others by an `ace` (a single space)

```hoon
:: Irregular form
::
[1 2 3 4]
:: Regular form (tall) separated by a gap
::
:^    4
    3
  2
1
:: Regular form (wide)
::
:^(1 2 3 4)
```

```hoon
:: Regular form (tall) separated by a gap
::
%-
add
:-  1  3
:: Regular form (wide)
::
(add 1 3)
```

### Branching

Test expression:
- `++gth` (greater than >)
- `++lth` (less than <)
- `++gte` (greater than or equal to ≥)
- `++lte` (less than or equal to ≤)

Branching expression:
- `?:` wutcol
- evaluates as `%.y` (true) or `%.n` (false).


```hoon
::  two/branch.hoon
::
::  Confirm whether a value is greater then one
::
|=  [a=@ud b=@ud]
^-  @t
?:  %-  gth  [a b]
  'yes'
'no'
```

### Types

Three kinds of types:

(1) Atoms
: values with auras
: a type of raw numeric data

(2) Molds
: structures like cells, lists. sets, arrays
: a structural type of data
: if atoms are atoms molds are molecules

(3) Marks
: files types
: a structural type of data with transformation rule
: if molds are molecules marks are proteins (capable of transformations)

Mold are used to:
1. Validate the shape of a noun ("clam")
2. Produce an example value ("bunt")

A mold is a function from a noun to a noun. A mold can be used to map any noun to a
typed value - If this fails, then the mold crashes.

Two mold runes are:
- `$?` bucwut, which forms a type union
- `$:` buccol, which forms a named tuple

#### Type Unions

A type union is a mold.

```hoon
:: Type union (Two constants)
::
$?  %foo
    %bar
==
:: Irregular form
::
`?(%foo %bar)`
```

```dojo
> `?(%foo %bar)`%foo
%foo
> `?(%foo %bar)`%xxx
dojo: hooon expression failed
```

#### Named Tuples

A named tuple is a mold.

```hoon
[x=.1.5 y=.0.5 z=.2]
```

## Examples

### Gate, Casting and Irregular Syntax

A nonsensical gate playing around with casting and irregular syntax.

```hoon
:: A gate (function) with spec (arguments) and a hoon (body).
:: Input value is called sample.
::
|=  val=@
:: A fence (return value type)
::
^-  [@ux @ux @ux]
:: Remove previous aura, cast to hex and give the value a face
:: ("symbolic tree address").
:: Written in wide and regular form.
::
=/  a  ^-  @ux  ^-  @  val
:: Same as above in irregular form
::
=/  b  ^-(@ux ^-(@ val))
:: Again same as above in another irregular form
::
=/  c  `@ux`val
:: Return value. Written in regular.
:: Irregular would be `[a b c]`.
::
:-  a  :-  b  c
```

### Imports

```hoon
:: two/ntw.hoon
::
:: Lesson 2
:: Convert numbers to words (ntw).
::
:: Load library
::
/+  number-to-words
|=  a=@
^-  @t
(to-words:eng-us:numbers:number-to-words a)
```
