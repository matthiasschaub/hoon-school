# Lesson 1

Hoon Syntax, expressions (`hoon` and `rune`), data (`atom` and `cell`), data types (`aura`), functions (`gate`) and branching.

## Terminology

Urbit consists of an identity protocol (“Azimuth”, or “Urbit ID”) and a system protocol (“Arvo”, or “Urbit OS”).

Urbit ID (Azimuth)
: is a general-purpose public-key infrastructure (PKI) on the Ethereum blockchain, used as a platform for Urbit identities. It provides a system of scarce and immutable identities which are cryptographically secure.

Urbit OS (Arvo)
: is an operating system which provides the software for the personal server platform that constitutes the day-to-day usage of Urbit. Arvo works over a peer-to-peer end-to-end-encrypted network to interact with other Urbit ships (or unique instances).

Hoon programs
: are built of expressions (`hoon`), rather like mathematical equations. Hoon expressions are built along a backbone of runes, which are two-character symbols that act like keywords in other programming languages to define the syntax, or grammar, of the expression. All runes take a fixed number of “children”. Children can themselves be runes with children, and Hoon programs work by chaining through these until a value—not another rune—is arrived at.

hoon
: a single function which produces a value.

runes
: a way to form expressions in Hoon (statements/keywords)
: if nouns are nouns, runes are verbs
: a pair of ASCII characters (a digraph)

subject
: the context in which an expression takes place
: every expression of Hoon is evaluated relative to its subject, a piece of data that represents the environment, or the context, of an expression.

noun
: an atom or a cells 
: everything in Hoon (and Nock, and Urbit) is a noun. The Urbit OS itself is a noun.

atom
: an nonzero integer number (0-∞)
: an unsigned integer.
: `42`

cell
: pair of two nouns
: `[0 1]`

aura
: a tag which lets you treat a number as text, time, date, Urbit address, IP address, and much more
: data-type
: `@t`

bunt
: is the default value of an aura
: `^*  @da`

clam
: validates shape of a noun

face
: is the symbolic tree address (variable name)
: “pin a face to the subject”
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
: `[1 3]`

`%-`
: cenhep slams a gate (calls a function)
: `%-  add  :-  1  3`

`=/`
: tisfas gives value a `face`
: variable name or symbolic tree address
: Combines a named noun with the subject
: Takes three children: 
: `=/  'some-face'  'some-value'  'the expression to receive the modified subject`.
: `=/  a  .5  ^-  @  a`

`^-`
: kethep casts by explicit type label.
: enforces type constrain
: `^-  @ux  ^-  @  5.5`

`^*`
: kettar produces example type value. 
: default value (bunt)
: `^*  @da`

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
