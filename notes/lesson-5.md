`^+` cast by example

```hoon
=/  list=(list @)  ~[1 2 3]
:: to access the head of a list (`i.`)
:: the list is required to be not null.
:: test before hand.
?~  list  !!
i.list
1
```

### Cell in Value Mode vs Structure Mode

structure mode
: `$:(@ud @ud)` results in `[@ud @ud]`
: `|=  a=[@ @]` is `|=  a=$:  @  @`
: uses `$` runes (i.e. `$:`) which define custom types.
: sample specification of gates, doors and type constructors are in structure mode

value mode
: `:-(1 2)` results `[1 2]`
`=/  a  [1 2]` is `=/  a  :-  1  2`
: uses `:` runes (i.e. `:-`) which produce cells.

The irregular syntax of `[]` is different between these two cases.
