# Notes 2

Irregular syntax, functions (`gate`), types, structures (`mold`) and programs (`generator`).

## Terminology

gate
: are deferred computations (function)
: takes one or more arguments and returns a value
: structurally gates consists of a `spec` (input specification) and a `hoon` (body)

spec
: the input specification
: it gives the type as a mold and attaches a face to it
: the input value is called a `sample`

referential transparency
: output value of a functions depends solely upon input value(s)

type
: a rule for interpretation
: (1) atoms (atom): values with auras
: (2) molds (molecule): structures (cells, lists and maps)
: (3) marks (protein): file types

mold
: defines Hoon structures (cells, lists and maps
: they have a default value ("bunt")
: they are strictly statically typed (e.e. they must match)
: gates which enforces a structure on a given noun (binary tree)
: a function from a noun to a noun

mark
: transformation rule for data (files types)

fence
: a way of making sure only data matching the appropriate structure get passed on
: enforce type constraint
: `^-  @t`

statically typed
: enforce type constraints

list
: a running cell which terminates in a `~` (null) atom
: null terminated tuple
: `[1 2 3 ~]`
: irregular syntax: `~[1 2 3]`

generator
: Hoon program stored in a file

## Runes

`|=`
: bartis produces a gate (function)
: `|=  [a=@ b=@]  %-  add   :-  a  b`

`^-`
: enforce type constraints
: kethep builds a fence
: `|=  a=@ud  ^-  @ud`

`%-`
: cenhep slams a gate (calls a function)
: `%-  add  :-  1  3`
: irregular syntax `(add 1 3)`


## Concepts

### Regular (Tall and Wide) and Irregular Forms

In tall mode, each rune and subexpression must be separated by a `gap` (tow or more spaces, or a line break).

In wide form the rune is immediately followed by parentheses `( )`, and the various subexpressions inside the parentheses must be separated from the others by an `ace` (a single space)

```hoon
:: Irregular form
::
[1 2 3 4]
:: Regular form (wide) separated by a ace
::
:^(1 2 3 4 5)
:: Regular form (tall) separated by a gap
::
:^    4
    3
  2
1
:: Regular form (tall) separated by a gap
::
:^  1  2  3  4
```

```hoon
:: Irregular form
::
(add 1 3)
:: Regular form (wide)
::
%-  add  :-  1  3
:: Regular form (tall)
::
%-(add :-(1 2))
```

### Types

A type is really a rule for interpretation. There are three kinds of types. All of these
are molds, or Hoon types. They are separated by complexity.

(1) Atoms with [aura](https://developers.urbit.org/reference/hoon/auras)
: values of a data-type
: a type of raw numeric data

(2) Molds
: structures like cells, lists and maps
: structural representation of data
: templates or rules for identifying actual type structures
: gates which enforces a structure on a given noun (binary tree)
: function from a noun to a noun.
: if `atoms` are atoms `cells` are molecules
: if `cells` are molecules `molds` are ideal molecules or a template

(3) Marks
: file types
: a structural type of data with transformation rule
: if `molds` are molecules `marks` are proteins (capable of transformations)

Mold are used to:
1. Validate the shape of a noun ("clam")
2. Produce an example value ("bunt")

A mold is a function from a noun to a noun. A mold can be used to map any noun to a
typed value - If this fails, then the mold crashes. They are actually gates, meaning that they operate on a value to coerce it to a particular structure.

Two things to do with molds are:

`$?`
: bucwut, which forms a type union
: `$?  [@ud @ux @ub ~]`

`$:`
: buccol, which forms a named tuple

#### Type Unions

A type union is a mold.

```hoon
::  Only accept an atom of an unsigned aura type
::
|=  [n=$?(@ud @ux @ub)]
(add n 1)
```

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
:: Wide form
::
=/  a  ^-  @ux  ^-  @  val
:: Tall form
::
=/  b  ^-(@ux ^-(@ val))
:: Irregular form
::
=/  c  `@ux`val
:: Return value. Written in regular.
:: Irregular would be `[a b c]`.
::
:-  a  :-  b  c
```
