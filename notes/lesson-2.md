# Lesson 2

Irregular syntax, Hoon structures (`mold`) and hoon programs (`generators`).

## Terminology

gate
: are deferred computations (function)
: structurally gates consists of a `spec` (input specification) and a `hoon` (body)

spec
: is the input specification
: It gives the type as a mold and attaches a face to it
: The input value is called a `sample`

mold
: defines Hoon structures (cells, lists, sets). They have a default value ("bunt") and are strictly statically typed (e.e. they must match)

fence
: is a way of making sure only data matching the appropriate structure get passed on (enforce type constraint): `|=  a=@ud  ^-  @ud` `irregular form` (syntactic sugar)

list
: is a running cell which terminates in a `~` (null) atom: `[1 2 3 ~]`

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

## Concepts

### Regular and Irregular Forms

Tall mode is separated by gap.

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

Evaluates as `%.y` (true) or `%.n` (false).

```hoon
::  branch.hoon
::
::  Confirm whether a value is greater then one
::
|=  a=@ud
?:  %-  gth  [a 1]
  'yes'
'no'
```

### Mold

Three kinds of types:
1. Atoms: Values with auras
2. Molds: Structures -> cells, lists. sets, arrays
3. Marks: files types

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
g: Type union (Two constants)
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
