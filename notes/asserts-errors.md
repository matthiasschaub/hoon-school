# Assertions and Errors

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
