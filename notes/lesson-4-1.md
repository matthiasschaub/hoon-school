# Lesson 4

Text (`cord`, `knot`, `term`, and `tape`) and lists

## Terminology

cord
: atom
: most compact way of storing text
: `'Text'`

tape
: list
: most useful for text processing (one char at a time)
: `(list @t)`
: `"Text"`

knot
: are used for expressing paths
: url-safe
: `@ta`

term
: text constants or label
: `@tas`
: `%text`

unit
: either an empty value (null or `~`) or a cell of an empty value and some other value.

## Runes

`!:`
: zapcol turns on error tracing

## Programs

crip
: cord -> tape
: "cord rip"
: `(crip "hello")`

trip
: tape -> cord
: "tape rip"
: `(trip 'hello')`

weld
: concatenation
: `(weld "Hello" "Mars!")`

cass
: lower case

cuss
: upper case

find
: looks for a needle in a haystack
: search text
: returns a unit.
: `(find "e" "Hello"`

lent
: length of string
: `(lent "Hello")`

snag
: get value at given index of a tape
: `(snag 3 "Hello")`

slag
: every thing left of given index

scag
: -

scot
: `(scot %ub 54.321)`

sort
: -
: `(sort ~[1 2 3 4] gth)`

gulf
: -

reap
: -

roll
: `(roll (gulf 1 5) mul)`
: `=fac  |=(n=@ud (roll (gulf 1 n) mul))`

turn
: `turn (gulf 65 90) @t)`
: `turn (gulf 1 20) fac)`

## Concepts

### Cords and Tapes

Cord as atom vs tapes as lists:

```dojo
> `@ux`'Cord'
0x6f.6c6c.6548
> `@ux`"Tape"
-need.@
-have.[i=@tD t=""]
nest-fail
dojo: hoon expression failed
```

### String Operations

1. producing text
2. manipulating text
3. analyzing text
  1. search
  2. parse
  3. convert to data

Interpolation:
```dojo
> "{<(add 5 6)>} is the answer.")
'11 is the answer.'
```

### List

There is no type list. List is a mold builder (a gate building gate which enforces a structure on given noun).

## Example

### Traps (loops) and lists

```hoon
:: /gen/splitter.hoon
::
:: Split a long "tape" into words at spaces
::
|=  ex=tape
=/  index  0
=/  result  *(list tape)
|-
?:  =(index (lent ex))
  (weld result ~[ex])
?:  =((snag index ex) ' ')
  :: deal w/ word break
  ::
  %=  $
    index  +(index)
    result  (weld result ~[`tape`(scag index ex)])
    ex  `tape`(slag +(index) ex)
  ==
:: otherwise just count up
::
$(index +(index))
```
