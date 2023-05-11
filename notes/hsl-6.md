# Assertions, Errors and Maps

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
