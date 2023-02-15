# Lesson 6 (WIP)

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

q# Errors

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
