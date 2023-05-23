# Lesson 7

- A `%say` generator (and its cousin the `%ask` generator) affords you more flexibility in generator inputs.
- Stateful applications requiring deferring parts of an expression relative to other parts.

## Terminology

mark
: data representation type

%say
: ...

## Runes

`*`
: tar is the default mold for a noun

`=*`
: evaluate on usage of the face, not on defining of the face (`=/`)

```hoon
|=  *       ::  any noun
(add 40 2)
```
equivalent to
```hoon
|_  *
++  $  (add 40 2)
--
```

## Programs

eny
: entropy

og
: random number generator


## Concepts

### `%say` Generators

#### Structure
```hoon
:-  %say        :: cell of %say and a gate
|=  ...
:-  %some-mark  :: cell of %some-mark and hoon (computation)
...
```
E.g.:
```hoon
:-  %say   :: make a cell of tag %say and a hoon (computation)
|=  *
:-  %noun  :: make (and return) a cell
(add 40 2)
```

#### Sample

```hoon
[[now=@da eny=@uvJ bec=beak] [unnamed args] [opt named args]]
```
E.g.:
```hoon
*
[[now=@da * *] ~]
[* [text=@t planet=@p ~]]
[* ~ [optional=@tas ~]]
[[now=@da eny=@uvJ bec=beak] [arg=@t ~] [option=@ud ~]]
```

#### Examples

```hoon
:: dice.hoon
::
:-  %say
|=  [[now=@da eny=@uvJ bec=beak] [n=@ud ~] [bet=@ud ~]]
:-  %noun
[(~(rad og eny) n) bet]
```

```dojo
> +dice 6, =bet 200
[1 200]
> +dice 6, =bet 200
[5 200]
```


### Agents

App lives as agents.

Agents are like database: Processes input and output. Manages state (persistence).


