# Making Decisions

Recursion, cores and binary trees

## Terminology

trap
: can be used to repeat a section of code with changes to values (recursion)

core
: is a cell pairing operations to data (data structure). Many cores have a default `$` (buc) arm, essentially the primary (or only) code.

arms
: hold code, while `legs` hold data. Both are `limbs`. Arms do things. Legs hold data

## Runes

`~?`
: a `hint`. sigwut tells the runtime to make a side effect (print).
: This is not nock, no changes to state are made.

`~&`
: a debugging print statement.
: This is not nock, no changes to state are made.

`|-`
: a `trap` sets a recursion point and immediately slams the `$` (buc) arm.

`%=`
: -

`==`
: Rune terminator

`--`
: Rune terminator

`%+`
: Apply a gate to [a b] cell sample

`|%`
: Produce a core, [battery payload]

`++`
: Code builder

`+$`
: Type builder

`=>`
: Compose two children. One is the operator, one is the thing which the operator needs to know about.

`=<`
: Same as above but inverted

`.+`
: -

`.=`
: -

Missing `!>` and `?()` (type union)

## Irregular Forms

- `=()` is `.=`

```hoon
%=  $
  n  (dec n)
==
```

is

```hoon
$(n (dec n))
```

## Concepts

### Cores

A core is a cell pairing operations to data (data structure).

A core is a cell `[battery payload]`:

- battery describes the things that can be done (the operations)
- payload describes the data on which those operations rely (the spec (input values) AND
  the subject (operating context))

- [battery payload] = [battery [sample context]]
- battery = code
- payload = data
- sample = input (arguments, parameters)
- context = effective subject of the battery

Tail (payload) of `dec` generator:
```dojo
> +:dec
[a=0 <46.hgz 1.pnw %140>]
> +6:dec
a=0
```

```
      1
  2       3
4   5   6   7
```

### Limbs

Limbs of a core (not the same as `[battery and payload]`):

- arms do things: computations (maked by `++` or `+$`)
- legs hold things: data

### Arms

An arm is a Hoon expression to be evaluated against the core subject (i.e. its parent
core is its subject).

Within a core, we label arms as Hoon expressions (frequently `|=` bartis gates) using
the `++` luslus digraph (`++` isn't formally a rune because it doesn't actually change
the structure of a Hoon expression.)

An example defining two gates as arms which can be called later:

```hoon
|=  n=@ud
:: compose two expressions
::
=>
:: define a core with two arms
::
|%
++  add-one
  |=  a=@ud
  ^-  @ud
  %:  add  a  1  ==
++  sub-one
  |=  a=@ud
  ^-  @ud
  %:  sub  a  1  ==
--
:: calls the gate add-one defined in the core above
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

### Addressing Limbs (Binary Trees)

Everything in Urbit is a binary tree. And all code in Urbit is also represented as data.
One corollary of these facts is that we can access any arbitrary part of an expression,
gate, core, whatever, via addressing. There are three different ways to access values:

- Numeric addressing (room number)
- Positional addressing (navigation)
- Wing addressing is a way of attaching a name to the address so that you can access it
  directly.

Values at addresses in a tree can be unambiguously located several ways.

### Access binary tree leafs.

Positional Addressing:

- `-` (left), `+` (right) or `<` (left) and `<` (right).
- `-/"hello"` -> `i="h"`
- `+/"hello"` -> `t="ello"`

Wing addressing:

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
a:data
b.data
aa.a.data
```

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
::
:: Mixing of absolute (wing) with relative (positional) addressing
::
+:bbb.aa.a.data
```

`|=` is equivalent to something like:

```hoon
:: Store main body of the gate (main) inside an arm named `%` ("buc")
::
=|  a
|%
++  $
```

`%` 
is the default arm for many cores.
