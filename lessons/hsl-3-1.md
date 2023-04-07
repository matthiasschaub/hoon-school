# Lesson 3 - Binary Trees and Addresses

## Binary Trees

Everything in Hoon (and Nock, and Urbit) is a noun.

A noun is an atom (unsigned integer) or a cell (pair of two nouns).

A noun is a binary tree whose leaves are atoms.

```
    [[1 2] [3 4]]

          .
         / \
        /   \
       /     \
      .       .
     / \     / \
    1   2   3   4
```

Nouns are utilized in three different manners:

1. formulas
2. subjects
3. products

A *formula* is a noun utilized as a function that takes in a noun, its *subject*, and returns a noun, its *product*.

## Addressing

Everything in Urbit is a binary tree. And all code in Urbit is also represented as data.
One corollary of these facts is that we can access any arbitrary part of an expression,
gate, core, whatever, via addressing. There are three different ways to access values:

- Numeric addressing (room number)
- Positional addressing (navigation)
- Wing addressing is a way of attaching a name to the address so that you can access it
  directly.

Values at addresses in a tree can be unambiguously located several ways.

### Numeric Addressing

Binary tree number addresses:
```
      1
  2       3
4   5   6   7
```

```dojo
> +1:[1 2 3]
[1 2 3]
> +2:[1 2 3]
1
> +3:[1 2 3]
[2 3]
> +4:[1 2 3]
dojo: hoon expression failed.
```

### Positional Addressing

- `-` (left), `+` (right) or `<` (left) and `>` (right).
- `-/"hello"` -> `i="h"`
- `+/"hello"` -> `t="ello"`

```dojo
> -:[1 2 3]
1
> +:[1 2 3]
2 3
```

### Wing Addressing

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
a:data
b.data
aa.a.data
```

```hoon
=data [a=[aa=[aaa=[1 2] bbb=[3 4]] bb=[5 6]] b=[7 8]]
::  Mixing of absolute (wing) with relative (positional) addressing
::
+:bbb.aa.a.data
```
