# Assertions, Errors, Doors and Maps

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

`|=`
: gate
: a core with one arm buc and a sample
: short form of `=>  a=spec  |%  ++  $  hoon  --`

`|%`
: produce a core, `[battery payload]`

`%-`
: call a gate
: short form of `%~($ a b)`
: pulls the *$* arm of the core *a* with the given sample *b* plugged into it

`%~`
: evaluate an arm in a door

## Terminology

door
: a core with a sample
: a gate-building core (function-building function)

gate
: a special case of a door
: a door with exactly one arm, named $ buc


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

A door is a core with a sample.

```
      door
     /    \
battery      .
          / \
    sample   context
```

A door's overall sample can affect how its gate-building arms work.

A gate is a special case of a door. A gate is a door with exactly one arm, named $ buc.


#### Example

Manipulating the sample of given core/door

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

### Maps

`++map` is a mold building gate.

Example Map:

| keys   | vals    |
| ---    | ---     |
| %red   | #ED0A3F |
| %green | #01A638 |
| %blue  | #0066FF |

`malt`
: a map builder

```hoon
> =colors `(map @tas @ux)`(my ~[[%red 0xed.0a3f] [%green 0x1.a638] [%blue 0x66ff]])
:: by is a core used to deal with maps.
:: pulling the put arm in the by core with the sample colors.
:: And then adding a value to it.
::
> =colors (~(put by colors) [%orangae 0xff.8833])
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
