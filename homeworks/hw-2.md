# HSL ~2023.3 %hw2

## Q1

You work in a lab. The lab uses a scale which is inaccurate for values less than 10 grams. Any weight less than that should simply register as zero in your measurements. Write a gate in an arm `++corrected-weight` which checks whether the value is less than 10 and returns zero if it is, otherwise returns the normal value. (Answer with the arm as the only arm in a regular `|%` core.)

```hoon
::
::    Q1
::
::        > =scale -build-file %/lib/hw2/q1/hoon
::        > (corrected-weight:scale 11)
::
|%                      :: a core
  ++  corrected-weight
    |=  measurement=@ud :: a gate
    ^-  @ud             :: a fence
    ?:  (gth measurement 10)
      measurement
    0
  --
```


## Q2

The lab needs to know the total quantity of reagent (in grams) you've been able to produce in the past week.  You have the totals for every day.  Write a gate in an arm `++weekly-reagent` which uses a trap to add up the seven values it receives in a 7-element list.  E.g., `~[134 287 12 0 127 194 0]` should sum to 754.  (Answer with the arm as the only arm in a regular |% core.)

```hoon
::
::    Q2
::
::        > =reagent -build-file %/lib/hw2/q2/hoon
::        > (weekly-reagent:reagent ~[1 1 1 1 1 1 1])
::
|%
  ++  weekly-reagent
    |=  elements=(list @ud)
    =/  sum  0
    =/  counter  0
    |-
    ?:  =(counter 7)
      sum
    %=  $
      counter  (add counter 1)
      sum  (add (snag counter elements) sum)
    ==
  --
```


## Q3

Produce a type arm named `reptile` using `+$` lusbuc which is a type union (`$?` bucwut) for several reptiles of your choice.  (E.g. if I were doing this for amphibians, I could use %frog, %toad, and %salamander.)  Provide at least four options in the type union.  (The `%word` syntax is a "term", or internal constant value we can use to label things in Hoon:  previewing this a bit!)

```hoon
::
::    Q3
::
::        > =q -build-file %/lib/hw2/q3/hoon
::        > (reptile:q ~[1 1 1 1 1 1 1])
::
|%                 :: core
  +$  reptile      :: typed arm
    $:             :: type  union
      %frog
      %toad
      %salamander
      %chamaeleon
    ==
--
```


## Q4

Produce a gate (generator) which accepts a list of values and increments each value, producing a list of the new values.

For example, given the `(list @)` `[1 2 3 4 5 ~]`, the generator should produce ~[2 3 4 5 6].

You can retrieve the n-th element in a list using the `++snag` gate:

```
> =/  n  0  (snag n [1 2 3 4 5 ~])
1
```

(Note that `++snag` counts starting at zero, not one.)

You can get the length of a list using `++lent`.

You can check for whether two values are equal using `=(1 2)` syntax (irregular form of `.=` dottis).

You can append a value to a list using `weld`, e.g. `(weld ~[1] ~[2])` → `~[1 2]`.

```hoon
::
::    Q4
::
::        > +hw2/q4 `(list @)`~[1 2]
::
|=  in=(list @)
^-  (list @)
=/  length  (lent in)
=/  out  *(list @)       :: bunt value (default value)
=/  counter  0
|-                       :: trap (recursion point)
?:  .=  counter  length  :: condition
  out
%=  $
  counter  (add counter 1)
  ::  snag: index
  ::  snoc: append
  ::
  out  (snoc out (add (snag counter in) 1))
==
```

## Q5

Produce a gate (generator) which accepts a list of values and yields a list with each value in *reverse* order.

For example, given the `(list @ux)` `[0x0 0x1 0x2 ~]`, the generator should produce `~[0x2 0x1 0x0]`.

Your code from the previous exercise should work with modest changes.

```hoon
::
::    Q5
::
::        > +hw2/q5 `(list @)`~[1 2]
::
|=  in=(list @)
^-  (list @)
=/  out  *(list @)       :: bunt value (default value)
=/  counter  (lent in)
|-                       :: trap (recursion point)
?:  .=  counter  0       :: condition
  out
%=  $
  counter  (dec counter)
  ::  snag: index
  ::  snoc: append
  ::
  out  (snoc out (snag (dec counter) in))
==
```
