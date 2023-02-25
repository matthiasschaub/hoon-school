# Libraries, Desks, Cores and Search Paths

## Terminology

library
: cores stored in `/lib` which provide access to arms and legs (operations and data)

desk
: organizes a collection of files, including generators, libraries, agents, and system code into on coherent bundle
: similar to a file drive or a Git branch

beak
: lets Clay globally identify any resource on any ship at any point in time.
: three components: (1) the ship; (2) the desk; (3) revision number or timestamp
: `/~zod/base/2/`

path
: a list of text identifiers
: first three are always the beak
: last one reverts to the mark
: `/~zod/base/~2022.6.14..18.16.53..2102/gen/ls/hoon`

marks
: file extension + conversation rules (e.g. yield JSON from Hoon data structures)

## Runes

`/+`
: faslus loads code
: library import

## Concepts

### Desk directory structure

Every desk has a standard directory structure
- `/app` for agents
- `/gen` for generators
- `/lib` for library and helper files
- `/mar` for marks
- `/sur` for shared structures
- `/ted` for threads

### Depth-First Search

Two cases (`.` vs `:`):
1. `.` represents a search path into something that is known about (data is known by dojo or part of the dojos subject).
2. `:` takes data as the subject (the horizon of known information).

```dojo
> =data [a=1 aa=2]
> a.data
1
> a:data
1
```

`^` ket skips a match.

````dojo
> collatz:[collatz=33 100]
33
> +:[collatz=33 100]
100
> +3:[collatz=33 100]
100
> collatz:[collatz=33 collatz=100 50]
33
> ^collatz:[collatz=33 collatz=100 50]
100
```

```hoon
|=  list=(list @)
^-  (^list @)  and :: Skip first match (the face)
```


### Cores

core
: [battery payload]
: [battery [sample subject]]

`|%`
: barcen is all battery

`|=`
: bartis is a battery with one arm $ and a sample

`|-`
: barhep is a battery with one arm $ and no sample

`|_`
: barcap is a battery with many arms and a sample

`|^`
: barket is a battery with many arms incl. $ and no sample


#### Changing the Sample

```dojo
> (roll `(list @rs)`~[.10 .12 .14] mul:rs)
:: fails: the default sample of mul is 0
:: solution: change the sample
> (roll `(list @rs)`~[.10 .12 .14] |=([a=_.1 b=_.1] (mul:rs)))
.168
```


## Example

```hoon
::  /gen/n2w.hoon
::
/+  number-to-words  :: import library
|=  n=@ud
::  use code from imported library
::
(to-words:eng-us:numbers:number-to-words n)
```

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
