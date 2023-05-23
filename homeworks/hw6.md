# HSL ~2023.3 %hw6

> Homework #6 for Hoon School Live.

- `;:` miccol, for changing the arity of a gate
- `?|` wutbar, logical OR
- `?&` wutpam, logical AND
- `?!` wutzap, logical NOT
- `?.` wutdot, inverse ?: wutcol
- `?-` wuthep, switch
- `?+` wutlus, switch with default

## Q1

Compose a gate which accepts a tape representing a hexadecimal color value and returns the equivalent `@ux` hexadecimal value.  E.g., given any of "#ABCDEF", "#abcdef", "ABCDEF", or "abcdef", the gate should return 0xab.cdef.

## Q2

Look up ++sub in hoon.hoon.  Rewrite the arm so that it 1) omits the ~/ and ~_ lines and 2) uses ?. instead of ?:.  (You may also remove the comment lines ::.)

## Q3

What does the `@q` aura do?  Try it on the values 65.535 and 65.536; compare to `@p`'s behavior on the same values.

### Answer


## Q4

Write a switch statement using a `?` wut rune which branches on a type union of `?(%one %two ...)` up to five, and returns the `@ud` equivalent in a unit.

## Q5

Curry ++gth using ++cury or ++curr such that its input is always evaluated with respect to 10.  (I.e. produce a gate that does this.)

```dojo
> =gth-ten (curr gth 10)
```

## Q6

Produce a gate which folds a list using ++reel or ++roll with ++add:rs to produce the cumulative sum of a list.  E.g. the sum of ~[.1.0 .0.5 .0.333 .0.25 .0.2 .0.167 .0.143 .0.125 .0.111] should be .2.829.

```hoon
|=  l=(list @rs)
^-  @rs
(roll `(list @rs)`l add:rs)
```

## Q7

Compose an expression using ;:'s irregular form to calculate the factorial of 5 (=120).
```hoon
:(mul 1 2 3 4 5)
```
