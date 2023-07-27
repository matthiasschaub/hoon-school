# Notes 5 - Lists and Text

Lists and Text (`cord`, `knot`, `term`, and `tape`).

## Terminology

list
: a running cell which terminates in a `~` (null) atom
: null terminated tuple
: `[1 2 3 ~]`
: irregular syntax: `~[1 2 3]`

cord
: atom
: most compact way of storing text
: `'Text'`

tape
: list
: list of individual characters
: most useful for text processing (one char at a time)
: `"with double quotes"`
: `(list @t)`

knot
: are used for expressing paths
: url-safe
: `@ta`

term
: text constants or label
: `@tas`
: `%text`

## Programs

`++limo`
: turns a null-terminated tuple into a `list`
: `(limo [1 2 3 ~])`


## Concepts

### List

List is a mold builder (a gate building gate which enforces a structure on given noun).
There is no type list.

```hoon
:: a face of type list with default value (bunt)
=/  out  *(list @)
:: is equivalent to
=| out=(list @)
```

```hoon
^-  %-  list  @ud  [1 2 3 ~]
:: is equivalent to
`(list @ud)`[1 2 3 ~]
```

### Cords and Tapes

Cord as atom vs tapes as lists:

```hoon
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
```hoon
> "{<(add 5 6)>} is the answer.")
'11 is the answer.'
```

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
