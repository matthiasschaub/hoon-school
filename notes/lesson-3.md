# Making Decisions

Recursion, cores and binary trees

## Terminology

type inference
: infer the type of an expression using syntactic clues
: `> ? 0x15` results in `@ux`

trap
: can be used to repeat a section of code with changes to values (recursion)

core
: is a cell pairing operations to data (data structure)
: many cores have a default `$` (buc) arm, essentially the primary (or only) code

limbs
: arms and legs

arms
: hold code
: do things

legs
: hold data

## Runes

`~?`
: sigzap is a `hint`
: tells the runtime to make a side effect (print)
: this is not nock, no changes to state are made

`~&`
: sigwut is a debugging print statement

`|-`
: barhep sets a `trap`
: sets a recursion point and immediately slams the `$` (buc) arm

`%=`
: centis resolves a wing of the subject, but with changes made.

`==`
: tistis is a rune terminator

`--`
: hephep is a rune terminator

`%+`
: cenlus applies a gate to [a b] cell sample

`|%`
: barcen produces a core, [battery payload]

`++`
: luslus produces an arm
: code builder

`+$`
: lusbuc produces a structured arm (type definition)
: type builder

`=>`
: Compose two children. One is the operator, one is the thing which the operator needs to know about.

`=<`
: Same as above but inverted

`.+`
: Increment

`.=`
: dottis tests for equality

Missing `!>` and `?()` (type union)

## Irregular Forms

- `=()` is `.=`

and following regular form

```hoon
%=  $
  n  (dec n)
==
```

is following irregular form

```hoon
$(n (dec n))
```

## Concepts

### Cores

A core is a cell of operations and data. Bar (`|`) runes make cores. A core is a cell `[battery payload]`.

battery
: describes the things that can be done (the operations)

payload
: describes the data on which the battery rely (the spec (input values) and the subject (operating context))

- [battery payload] = [battery [sample context]]
- battery = code
- payload = data
- sample = input (arguments, parameters)
- context = effective subject of the battery

Head (battery) of `dec` generator: `+:dec`

Tail (payload) of `dec` generator::
```dojo
> +:dec
[a=0 <46.hgz 1.pnw %140>]
> +>:dec
a=0
```

### Limbs

Limbs of a core (not the same as `[battery and payload]`):

- arms do things: code (marked by `++` or `+$`)
- legs hold things: data

### Arms

An arm is a Hoon expression to be evaluated against the core subject (i.e. its parent 
core is its subject). Arm is a features of core (no arms outside of cores).

Within a core, we label arms as Hoon expressions (frequently `|=` bartis gates) using
the `++` luslus digraph (`++` isn't formally a rune because it doesn't actually change
the structure of a Hoon expression.)

An example defining two gates as arms which can be called later:

```hoon
|=  n=@ud
::  compose two expressions
::
=>
::  define a core with two arms
::
|%                  :: generic core
++  pi  .3.1415926  :: arm w/ name (just a value)
++  add-one         :: another arm (code)
  |=  a=@ud         :: gate
  ^-  @ud           :: return type
  (add a 1)
++  sub-one
  |=  a=@ud
  ^-  @ud
  (sub a 1)
--                 :: closes the core (b/c any # of arms)
::  calls the gate add-one defined in the core above
::
%:  add-one  n  ==
```

Another example defining a card deck type as core:

```hoon
|%
+$  suit  ?(%hearts %spades %clubs %diamonds)
+$  rank  ?(1 2 3 4 5 6 7 8 9 10 11 12 13)
+$  card  [sut=suit val=rank]
+$  deck  (list card)
--
```

### Recursion

trap (`|-`) is a core with single arm named buc (`$`).

centis (`|-`) tells Hoon to find the buc (`$`) core and reevaluate it with the list of changes attached to it.

```hoon
::  Recursion using traps
::
=/  counter  1
=/  sum  0
::  sets a recursion point
::  and immediately slams the `$` (buc) arm
::
|-
?:  (gth counter 5)
  sum
::  centis tells Hoon to find the buc core
::  and reevaluate it with the list of changes attached to it
::
%=  $
  ::  following two lines are executed "at the same time"
  ::  (atomic operation)
  ::
  counter  (add counter 1)
  sum      (add sum counter)
==
```

### Addressing Limbs (Binary Trees)

Everything in Urbit is a binary tree. And all code in Urbit is also represented as data.
One corollary of these facts is that we can access any arbitrary part of an expression,
gate, core, whatever, via addressing. There are three different ways to access values:

- Numeric addressing (room number)
- Positional addressing (navigation)
- Wing addressing is a way of attaching a name to the address so that you can access it
  directly.

Values at addresses in a tree can be unambiguously located several ways.

#### Numeric Addressing

Binary tree number addresses:
```
      1
  2       3
4   5   6   7
```

```dojo
> +1:[1 2 3]
[1 2 3]
> +2:[1 2 3]
1
> +3:[1 2 3]
[2 3]
> +4:[1 2 3]
dojo: hoon expression failed.
```

#### Positional Addressing

- `-` (left), `+` (right) or `<` (left) and `>` (right).
- `-/"hello"` -> `i="h"`
- `+/"hello"` -> `t="ello"`

```dojo
> -:[1 2 3]
1
> +:[1 2 3]
2 3
```

#### Wing Addressing

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
a:data
b.data
aa.a.data
```

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
::  Mixing of absolute (wing) with relative (positional) addressing
::
+:bbb.aa.a.data
```

## Examples

- [/lib/number-to-words.hoon](/gen/three/number-to-words.hoon)

```hoon
::  /lib/number-to-words.hoon
::
::  |number-to-words: conversion of unsigned integers to a tape
::
::  returns a unit because not all numbers can always be represented
::
|%
++  numbers
  |%
  ++  ten                    10
  ++  one-hundred            100
  ++  one-thousand           (pow 10 3)
  ++  one-million            (pow 10 6)
  ++  one-billion            (pow 10 9)
  ++  one-trillion           (pow 10 12)
  ++  one-quadrillion        (pow 10 15)
  ++  one-quintillion        (pow 10 18)
  ++  one-sextillion         (pow 10 21)
  ++  one-septillion         (pow 10 24)
  ++  one-octillion          (pow 10 27)
  ++  one-nonillion          (pow 10 30)
  ++  one-decillion          (pow 10 33)
  ++  one-undecillion        (pow 10 36)
  ++  one-duodecillion       (pow 10 39)
  ++  one-tredecillion       (pow 10 42)
  ++  one-quattuordecillion  (pow 10 45)
  ++  one-quindecillion      (pow 10 48)
  ++  one-sexdecillion       (pow 10 51)
  ++  one-septendecillion    (pow 10 54)
  ++  one-octodecillion      (pow 10 57)
  ++  one-novemdecillion     (pow 10 60)
  ++  one-vigintillion       (pow 10 63)
  ++  max                    (pow 10 66)
  --
++  eng-us
  |%
  ++  to-words
    |=  num=@u
    ^-  (unit tape)
    =+  numbers
    ?:  (gte num max)
      ~
    :-  ~
    |-
    ^-  tape
    ::  0-19
    ?:  =(num 0)   "zero"
    ?:  =(num 1)   "one"
    ?:  =(num 2)   "two"
    ?:  =(num 3)   "three"
    ?:  =(num 4)   "four"
    ?:  =(num 5)   "five"
    ?:  =(num 6)   "six"
    ?:  =(num 7)   "seven"
    ?:  =(num 8)   "eight"
    ?:  =(num 9)   "nine"
    ?:  =(num 10)  "ten"
    ?:  =(num 11)  "eleven"
    ?:  =(num 12)  "twelve"
    ?:  =(num 13)  "thirteen"
    ?:  =(num 14)  "fourteen"
    ?:  =(num 15)  "fifteen"
    ?:  =(num 16)  "sixteen"
    ?:  =(num 17)  "seventeen"
    ?:  =(num 18)  "eighteen"
    ?:  =(num 19)  "nineteen"
    ::  20-99
    ::
    ::  tpl: tens place
    ::  rem: ones place
    ::  sfx: suffix
    ::
    =/  tpl  (div num ten)
    =/  rem  (mod num ten)
    =/  sfx
      ?:  |(=(rem 0) (gte tpl 10))
        ~
      ['-' $(num rem)]
    ?:  =(tpl 2)  (weld "twenty" sfx)
    ?:  =(tpl 3)  (weld "thirty" sfx)
    ?:  =(tpl 4)  (weld "forty" sfx)
    ?:  =(tpl 5)  (weld "fifty" sfx)
    ?:  =(tpl 6)  (weld "sixty" sfx)
    ?:  =(tpl 7)  (weld "seventy" sfx)
    ?:  =(tpl 8)  (weld "eighty" sfx)
    ?:  =(tpl 9)  (weld "ninety" sfx)
    ::  100-max
    ::
    ::  num-break: repeated pattern from 100 on
    ::
    =/  num-break
      ::
      ::  min: minimum to qualify for this break
      ::  str: english word for this break
      ::
      |=  [min=@u str=tape]
      =/  rem  (mod num min)
      ;:  weld
        ^$(num (div num min))
        [' ' str]
        ?:  =(rem 0)
          ~
        %+  weld
          ?:((lth rem one-hundred) " and " ", ")
        ^$(num rem)
      ==
    ::
    ?:  (lth num one-thousand)
      (num-break one-hundred "hundred")
    ?:  (lth num one-million)
      (num-break one-thousand "thousand")
    ?:  (lth num one-billion)
      (num-break one-million "million")
    ?:  (lth num one-trillion)
      (num-break one-billion "billion")
    ?:  (lth num one-quadrillion)
      (num-break one-trillion "trillion")
    ?:  (lth num one-quintillion)
      (num-break one-quadrillion "quadrillion")
    ?:  (lth num one-sextillion)
      (num-break one-quintillion "quintillion")
    ?:  (lth num one-septillion)
      (num-break one-sextillion "sextillion")
    ?:  (lth num one-octillion)
      (num-break one-septillion "septillion")
    ?:  (lth num one-nonillion)
      (num-break one-octillion "octillion")
    ?:  (lth num one-decillion)
      (num-break one-nonillion "nonillion")
    ?:  (lth num one-undecillion)
      (num-break one-decillion "decillion")
    ?:  (lth num one-duodecillion)
      (num-break one-undecillion "undecillion")
    ?:  (lth num one-tredecillion)
      (num-break one-duodecillion "duodecillion")
    ?:  (lth num one-quattuordecillion)
      (num-break one-tredecillion "tredecillion")
    ?:  (lth num one-quindecillion)
      (num-break one-quattuordecillion "quattuordecillion")
    ?:  (lth num one-sexdecillion)
      (num-break one-quindecillion "quindecillion")
    ?:  (lth num one-septendecillion)
      (num-break one-sexdecillion "sexdecillion")
    ?:  (lth num one-octodecillion)
      (num-break one-septendecillion "septendecillion")
    ?:  (lth num one-novemdecillion)
      (num-break one-octodecillion "octodecillion")
    ?:  (lth num one-vigintillion)
      (num-break one-novemdecillion "novemdecillion")
    (num-break one-vigintillion "vigintillion")
  --
--
```
