# Lesson 1

Hoon syntax, expressions (`hoon` and `rune`), values (`atom` and `cell`), data types (`aura`) and branching.

## Terminology

### Urbit

Urbit consists of an identity protocol (“Azimuth”, or “Urbit ID”) and a system protocol (“Arvo”, or “Urbit OS”).

Urbit ID (Azimuth)
: an identity protocol
: is a general-purpose public-key infrastructure (PKI) on the Ethereum blockchain, used as a platform for Urbit identities. It provides a system of scarce and immutable identities which are cryptographically secure.

Urbit OS (Arvo)
: a system protocol
: a clean-slate OS
: a single pure function
: A peer-to-peer end-to-end-encrypted network
: A complete stack for personal computing in the cloud and a network between the nodes that run that stack (ships)

Urbit ship
: unique instance of a computer in the network

### Hoon

Hoon
: A strictly typed functional programming language
: Hoon compiles to Nock

Nock
: A purely functional typeless programming language (low level)
: A minimalist Turing complete combinator calculus
: A Turing-complete function that maps a cell [subject formula] to a noun product
: A machine language for the Urbit virtual machine layer and event log.
: decrement: `[8 [1 0] 8 [1 6 [5 [0 7] 4 0 6] [0 6] 9 2 [0 2] [4 0 6] 0 7] 9 2 0 1]`

noun
: everything in Hoon (and Nock, and Urbit) is a noun
: an atom or a cell
: a Binary tree whose leaves are atoms

atom
: an nonzero integer number (0-∞)
: an unsigned integer
: `42`

cell
: pair of two nouns
: `[0 1]`

Hoon programs
: are built of expressions (`hoon`), rather like mathematical equations. Hoon expressions are built along a backbone of runes, which are two-character symbols that act like keywords in other programming languages to define the syntax, or grammar, of the expression. All runes take a fixed number of “children”. Children can themselves be runes with children, and Hoon programs work by chaining through these until a value—not another rune—is arrived at.

hoon
: a single function which (always) produces a value.

runes
: a way to form expressions in Hoon (statements/keywords)
: fundamental operators/functions
: if nouns are nouns, runes are verbs
: made out of two ASCII special characters (digraphs)
: `=/`

subject
: the context in which an expression takes place
: every expression of Hoon is evaluated relative to its subject, a piece of data that represents the environment, or the context, of an expression.
: the subject is the noun against which any arbitrary Hoon code is evaluated.

[aura](https://developers.urbit.org/reference/hoon/auras)
: a metadata “interpretation” of an atom.
: a tag which lets you treat a number as text, time, date, Urbit address, IP address, and much more
: data-type
: ``> `@ub`32`` results in `0b10.0000`

bunt
: is the default value of an aura
: `^*  @da`

clam
: validates shape of a noun
: ensures that everything in the second child matches the aura of the first
: enforce type constraints
: `^-  @ux  0x1ab4`

face
: “pin a face to the subject”
: is the symbolic tree address (variable name)
: accepts three child expressions: a name (or face), a value, and the rest of the expression
: `=/  a  .5`

ace
: are single spaces

gap
: is everything more than one space

## Runes

`::`
: Comment

`:-`
: colhep construct a cell (2-tuple).
: `:-  1  3`
: irregular syntax `[1 3]`

`:^`
: colket construct a quadruple (4-tuple).

`%-`
: cenhep slams a gate (calls a function)
: `%-  add  :-  1  3`
: irregular syntax `(add 1 3)`

`=/`
: tisfas gives value a `face`
: variable name or symbolic tree address
: Combines a named noun with the subject
: Takes three children: 
: `=/  'some-face'  'some-value'  'the expression to receive the modified subject`.
: `=/  a  .5  ^-  @  a`

`^-`
: kethep casts by explicit type label
: enforces type constrain
: enforces that `hoon` matches `aura`
: `^-  @ux  ^-  @  5.5`
: irregular syntax: ```@ux`5.5``

`^*`
: kettar produces example type value. 
: default value (bunt)
: `^*  @da`

`?:`
: wutcol branches on a boolean test
: `?:((gth 1 0) 3 4)`


## Concepts

### Nouns

Utilized in three different manners:

1. formulas
2. subjects
3. products

A *formula* is a noun utilized as a function
that takes in a noun, its *subject*,
and returns a noun, its *product*.

### Runes

Runes are separated from one another by either two spaces or a line break. Both called 'gap'.

All runes take a fixed number of “children”. Children can themselves be runes with children, and Hoon programs work by chaining through these until a value - not another rune - is arrived at.

### Syntax

Tree-like structure of branching expressions joined by runes:

```
         :-
        /  \
       5    6

         %-
        /  \
      add  :-
          /  \
         5    6

         %-
        /  \
      add  :-
          /  \
         5    %-
             /  \
           add  :-
               /  \
              6    7
```

### Branching

Branching expression:
- `?:` wutcol
- evaluates as `%.y` (true) or `%.n` (false).

```hoon
?:  =([a b])
  'yes'
'no'
```

Test expression:
- `++gth` (greater than >)
- `++lth` (less than <)
- `++gte` (greater than or equal to ≥)
- `++lte` (less than or equal to ≤)

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

## Examples

### Gates and cells

```
%-  add  :-  5  6

    %-
   /  \
 add  :-
     /  \
    6  g 7
```

### Bunting and Casting

Bunting and casting with the date type.

Urbit can represent dates which predate the universe. The universe is about
13.000.000.000 years old.

```dojo
> ^*  @da     :: bunt (default value)
~2000.1.1
> ^-  @da  0  :: earliest date
~292277024401-.1.1
```
