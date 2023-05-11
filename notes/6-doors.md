# Notes 6 - More on Cores and Doors

Core patterns can be used to build many kinds of customized gates, and to modify the sample.
- The door is a common configuration for an Urbit core.
- The arms of doors are generally gate-building gates.
- A desk in Clay organizes collections of code and data resources. (not covered in video, see lesson notes)
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
