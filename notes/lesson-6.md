# Lesson 6

## Terminology

arity
: number of values a gate or door operates on

currying
: build a new gate in which part of the sample has been bind to particular values (freezing part of the sample)
: reduces the number of values that are needed to complete the computation
: gate-building-gate

## Runes

`;:`
: miccol change arity from binary to n-array

```
> (add 3 (add 4 5))
12
> :(add 3 4 5)
12
```

## Concepts

### Gate Manipulation

Gates can be manipulated to accept different numbers of arguments, or applied across multiple values, using functional programming arms.

1. change arity by increasing the number of values it operates (`;:` miccol)
2. change arity by reducing the number of values in the sample (`++curr` and `++cury`)
3. chain gates together (`++cork` and `++crol`)
4. fold gates together (`++roll` and `++reel`)


Currying:
```
> =my-gate |=  [x=@ud a=@ud b=@ud c=@ud]
(add (add (mul a (mul x x)) (mul b x)) c)
> =my-one-gate (curr my-gate [3 4 5])
> (my-one-gate 2)
25
```
