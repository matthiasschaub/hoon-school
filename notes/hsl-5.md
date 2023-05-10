# Libraries, Desks, Cores and Search Paths

## Terminology

## Concepts

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


Primary use bartis (`|=`), barcab (`|_`), and barcen (`|%`).


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
