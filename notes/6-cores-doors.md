# Notes 6 - More on Cores and Doors

Core patterns can be used to build many kinds of customized gates, and to modify the sample.
- The door is a common configuration for an Urbit core.
- The arms of doors are generally gate-building gates.
- Gate-building gates are a common design pattern in Hoon.

## Terminology

core
: [battery payload]
: [battery [sample context]]

payload
: subject that the core sees ([sample context])

sample
: input arguments

context
: rest of the subject

door
: a core with a sample
: a gate-building core (function-building function)

gate
: a special case of a door
: a door with exactly one arm, named $ buc

## Runes
`+$`
: produce a structure arm (type definition)
: `+$  value  [@p @ud]`

`$:`
: builds a cell of values
: form a cell type.

`$_`
: buccab specify different default value for type
: irregular form: `_type`

`%-`
: call a gate
: short form of `%~($ a b)`
: pulls the *$* arm of the core *a* with the given sample *b* plugged into it

`%~`
: evaluate an arm in a door
: irregular syntax: `~()`

`|%`
: barcen
: core
: general battery

`|=`
: bartis
: gate (function)
: battery with one arm `$` and a sample (a gate)
: short form of `=>  a=spec  |%  ++  $  hoon  --`

`|-`
: barhep
: trap (loop)
: battery with one arm $ and no sample

`|_`
: barcap
: door
: battery with many arms and a sample

`|^`
: barket
: battery with many arms incl. $ and no sample


## Concepts

### Gate-Building Gates

gate-building arms (such as `++list`) are frequently used as templates to build type-appropriate cores, including gates.

### Cores

A gate (`|=`) is a core with exactly one arm `$`. Following expression (evaluated by `%-  mygate  1`) ...
```hoon
|=  n=@ud
(add n 1)
```
... translates to (evaluated by `%~  $  mydoor 1`):
```hoon
|_  n=@ud
++  $  (add n 1)
--
```

A trap (`|-`) is a battery with one arm `$` and no sample. Following expression ...
```hoon
=/  index  0
|-
?:  =(5 index)  index
%=  $
  index  +(index)
==
```
... translates to:
```hoon
=/  index  0
=>
|%
++  $
  ?:  =(5 index)  index
  %=  $
    index  +(index)
  ==
--
$
```

If a core has an named arm, centis (`=>`) can change the values that are going into that core (Hot reloading of code).


### Doors

A door is a core with a sample.

```
      door
     /    \
battery    .
          / \
    sample   context
```

`|_`
: door definition

`%~`
: door evaluation
: irregular syntax: `~()`

The core itself has a sample in addition to the samples of gates defined in that core.
A door's overall sample can affect how its gate-building arms work.

Doors can build gates on-demand subject to certain data.

```hoon
::  f(x) = ax^2 + bx + c
|_  [a=@ud b=@ud c=@ud]
++  quad
  |=  x=@ud
  (add (add (mul a (mul x x)) (mul b x)) c)
--
```

Evaluate an arm in a door with `%~`: `(~(quad poly [5 4 3]) 2)`


### Immediate evaluation of a core with arms

```hoon
|^
(mul:rs (area-of-circle .2.0) height)
++  area-of-circle
  |=  r=@rs
  (mul:rs r (mul:rs pi r))
++  pi  .3.1415926
++  height  .10.0
--
```

### Changing the Sample

```dojo
> :: fails: the default sample of mul is 0
> (roll `(list @rs)`~[.10 .12 .14] mul:rs)
> :: solution: change the sample
> (roll `(list @rs)`~[.10 .12 .14] |=([a=_.1 b=_.1] (mul:rs)))
.168
```

Manipulating the sample of given core/door:
```hoon
|_  b=@
++  plus   |=(a=@ (add a b))
++  times  |=(a=@ (mul a b))
--
```

```dojo
> (plus:c 10)         :: call the arm
10

> (times:c 10)
0

> +6:c                :: the sample
b=0

> (plus:c(b 7) 10)    :: mutate c sample and call the arm
17

> (times:c(b 7) 10)
70
                      :: generates the arm product after modifying the door's sample to be arg
> (~(plus c 7) 10)    :: ~(arm door arg)
17

> (~(times c 7) 10)
70
```

## Examples

```hoon
:: /lib/playing-cards
:: represent a deck of 52 playing cards
::
|%  :: produce a core which contains the entire library's code
+$  suit  ?(%hearts %spades %clubs %diamonds)  :: define type union
+$  darc  [sut=suit val=@ud]                   :: define tuple
+$  deck  (list darc)                          :: define list
++  make-deck        :: arm
  ^-  deck           :: fence
  =/  mydeck  *deck  :: bunts (produce a default value) and give it a face
  =/  i  1
  |-                 :: trap
  ?:  (gth i 4)      :: branch on boolean test
    mydeck           :: return
  =/  j  2
  |-                 :: trap
  :: branch on boolean test (inverted)
  :: heavier code should be lower in the expression (convention)
  ::
  ?.  (lte j 13)
    :: increments i and jumps to outer loop.
    :: ^$ is the $ arm of a higher scope.
    ::
    ^$(i +(i))
  %=  $              :: resolves the wing with changes
    j       +(j)
    mydeck  [[(num-to-suit i) j] mydeck]
  ==                 :: terminate buc arm
++  num-to-suit
:: takes a single unsigned decimal integer and produces a suit
::
  |=  val=@ud     :: gate
  ^-  suit        :: fence
  ?+  val  !!     :: switch against a union. Crash if there are no matches (!!)
    %1  %hearts
    %2  %spades
    %3  %clubs
    %4  %diamonds
  ==              :: terminate switch
++  shuffle-deck
:: assembles a deck of 52 cards by cycling through every possible suit
:: and number and combining them
::
  |=  [unshuffled=deck entropy=@]
  ^-  deck
  =/  shuffled  *deck
  =/  random  ~(. og entropy)
  =/  remaining  (lent unshuffled)
  |-
  ?:  =(remaining 1)
    :_  shuffled
    (snag 0 unshuffled)
  =^  index  random  (rads:random remaining)
  %=  $
    shuffled      [(snag index unshuffled) shuffled]
    remaining     (dec remaining)
    unshuffled    (oust [index 1] unshuffled)
  ==
++  draw
:: produce a cell of two decks
  |=  [n=@ud d=deck]         :: two samples: An unsigned integer and a deck.
  ^-  [hand=deck rest=deck]  :: produces two decks: Hand cards and the rest
  :-  (scag n d)             :: first n elements from a list (deck)
  (slag n d)                 :: remaining cards
--
```
