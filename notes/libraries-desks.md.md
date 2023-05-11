# Libraries and Desks

## Terminology

library
: cores stored in `/lib` which provide access to arms and legs (operations and data)

desk
: organizes a collection of files, including generators, libraries, agents, and system code into on coherent bundle
: similar to a file drive or a Git branch

beak
: lets Clay globally identify any resource on any ship at any point in time.
: three components: (1) the ship; (2) the desk; (3) revision number or timestamp
: `/~zod/base/2/`

path
: a list of text identifiers
: first three are always the beak
: last one reverts to the mark
: `/~zod/base/~2022.6.14..18.16.53..2102/gen/ls/hoon`

marks
: file extension + conversation rules (e.g. yield JSON from Hoon data structures)

## Runes

`/+`
: fasls loads a library
: import the contents of a file in the `/lib` directory

## Concepts

### Desk directory structure

Every desk has a standard directory structure
- `/app` for agents
- `/gen` for generators
- `/lib` for library and helper files
- `/mar` for marks
- `/sur` for shared structures
- `/ted` for threads

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
