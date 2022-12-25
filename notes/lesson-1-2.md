# Lesson 1 and 2

> Note: Following definitions are mainly taken directly from the [Hoon School curriculum](https://developers.urbit.org/guides/core/hoon-school/A-intro).

Irregular syntax, Urbit types, gates and generators

## Terminology

Urbit consists of an identity protocol (“Azimuth”, or “Urbit ID”) and a system protocol (“Arvo”, or “Urbit OS”).

Urbit ID (Azimuth)
: is a general-purpose public-key infrastructure (PKI) on the Ethereum blockchain, used as a platform for Urbit identities. It provides a system of scarce and immutable identities which are cryptographically secure.

Urbit OS (Arvo)
: is an operating system which provides the software for the personal server platform that constitutes the day-to-day usage of Urbit. Arvo works over a peer-to-peer end-to-end-encrypted network to interact with other Urbit ships (or unique instances).

Hoon programs
: are built of expressions (`hoon`), rather like mathematical equations. Hoon expressions are built along a backbone of runes, which are two-character symbols that act like keywords in other programming languages to define the syntax, or grammar, of the expression. All runes take a fixed number of “children”. Children can themselves be runes with children, and Hoon programs work by chaining through these until a value—not another rune—is arrived at.

hoon
: expression is a single function which produces a value. Each expression takes place in a certain context (the "subject").

noun
: is an atom or a cell. An atom is an unsigned integer. A cell is a pair of two nouns. Everything in Hoon (and Nock, and Urbit) is a noun.

atom
: is an nonzero integer number (0-∞)

cell
: is pair of two nouns

runes
: are a way to form expressions in Hoon (statements/keywords). If nouns are nouns, runes are verbs.

aura
: is a metadata "interpretation" of an atom (data-type). The aura `@t` means text ("cord").

bunt
: is the default value of an aura

clam
: validates shape of a noun

face
: is the symbolic tree address (variable name)

mold
: defines Hoon structures (cells, lists, sets). They have a default value ("bunt") and are strictly statically typed (e.e. they must match)

gate
: are deferred computations (function). Structurally gates consists of a `spec`
(input specification) and a `hoon` (body).

spec
: is the input specification. It gives the type as a mold and attaches a face to it. The input value is called a `sample`.

fence
: is a way of making sure only data matching the appropriate structure get passed on (enforce type constraint): `|=  a=@ud  ^-  @ud` `irregular form` (syntactic sugar)

ace
: are single spaces

gap
: is everything more than one space

list
: is a running cell which terminates in a `~` (null) atom: `[1 2 3 ~]`


## Runes

`::`
: Comment

`:-`
: colhep construct a cell (2-tuple).

`|=`
: bartis produces a gate (function): `|=  [a=@ b=@]  (add a b)`

`%-`
: cenhep slams a gate (calls a function)

`=/`
: tisfas gives value a `face` (variable name or symbolic tree address) possible with type annotation. Combines a named noun with the subject. Takes three children: `=/  'some-face'  'some-value'  'the expression to receive the modified subject`. E.g: `=/  a  .5  ^-  @  a`

`^-`
: kethep casts by explicit type label. First remove type: `^-  @ux  ^-  @  5.5`

`^*`
: kettar produces example type value. A default value (i.e., 'bunt value') of the type p: `^*  @da`

`?:`
: wutcol branches on a boolean test: `?:((gth 1 0) 3 4)`


## Concepts

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

## Examples

### Regular and Irregular Forms

```hoon
:: Irregular form
::
[1 2 3 4]
:: Regular form (tall)
::
:^    4
    3
  2
1
:: Regular form (wide)
::
:^(1 2 3 4)
```

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

### Bunting and Casting

Bunting and casting with the date type.

Urbit can represent dates which predate the universe. The universe is about
13.000.000.000 years old.

```dojo
> ^*  @da  :: bunt (default value)
~2000.1.1
> ^-  @da  0  :: earliest date
~292277024401-.1.1
```

### Named Tuples

A named tuple is a mold.

```hoon
[x=.1.5 y=.0.5 z=.2]
```

### Type Unions

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
