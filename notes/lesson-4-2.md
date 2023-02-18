# Lesson 4

libraries.

## Runes

`/+`
: fasls loads a library
: import the contents of a file in the `/lib` directory

## Concepts

### Imports

```hoon
::
::   Convert numbers to words (ntw).
::
:: Load library
::
/+  number-to-words
|=  a=@
^-  @t
(to-words:eng-us:numbers:number-to-words a)
```
