# Assertions, Errors and Doors (Maps)

## Runes

`?~`
: branch on null
: non-null assertion

`?>`
: positive assertion
: condition must by %.y

`?<`
: negative assertion
: condition must by %.n

`+$`
: produce a structure arm (type definition)
: `+$  value  [@p @ud]`

`$:`
: builds a cell of values
: form a cell type.

## Errors

1. Syntax error: general case (%one-argument)
2. Syntax error: mismatched rune children
3. Type issues: need/have

```dojo
> `@ux`~zod
mint-nice
-need.@ux
-have.@pp
nest-fail
```

```dojo
> =/  list=(list @)  ~[1 2 3]
  i.list  :: head of list
-find.i.list
fing-fork
```

## Concepts

### Cell in Value Mode vs Structure Mode

The irregular syntax of `[]` is different between these two cases:

1. structure mode: `|=  a=[@ @]` is `|=  a=$:  @  @`
  - uses `$` runes (i.e. `$:`) which define custom types.
2. value mode: `=/  a  [1 2]` is `=/  a  :-  1  2`
  - uses `:` runes (i.e. `:-`) which produce cells (pairs of values)

### Gate-Building Gates

gate-building arms are frequently used as templates to build type-appropriate cores, including gates.

### Doors

```
        door
       /    \
battery      .
            / \
      sample   context
```

#### Maps

| keys   | vals    |
| ---    | ---     |
| %red   | #ED0A3F |
| %green | #01A638 |
| %blue  | #0066FF |

`malt`
: a map builder

```hoon
=/ col  `(map @tas @ux)`(my ~[[%red 0xed.0a3f] [%green 0x1.a638] [%blue 0x66ff]])
:: by is a core used to deal with maps.
:: pulling the put arm in the by core with the sample colors.
:: And then adding a value to it.
::
(~(put by colors) [%orangae 0xff.8833])
```


#### TODO

```hoon
|%
+$  val   [@p @ud]
+$  url   @t
+$  rank  ?(%galaxy %star %planet %moon)  :: type union
+$  card  card:agent:gall                 :: alias
--
```

`%-  1  2` transforms into `%~($ 1 2)`
