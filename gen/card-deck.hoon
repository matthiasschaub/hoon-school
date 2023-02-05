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
