# Hoon School

Notes on learning [Hoon](https://developers.urbit.org/reference/hoon/overview).

A lot of the definitions and code examples are taken directly from either the [official documentation on Hoon](https://developers.urbit.org/reference/hoon/overview) or from the [Hoon School curriculum](https://developers.urbit.org/guides/core/hoon-school/A-intro).

## Lessons

The git repository with the code related to the lessons can be found [here](https://git.sr.ht/~talfus-laddus/hoon-school).

1. Hoon syntax, expressions (`hoon` and `rune`), values (`atom` and `cell`), data types (`aura`) and branching.
    - [notes](notes/lesson-1.md)
2. Irregular syntax, more branching, functions (`gate`), structures (`mold`) and programs (`generator`).
    - [notes](notes/lesson-2.md)
    - code
        - [branch.hoon](gen/branch.hoon)
3. Recursion, cores and binary trees
    - [notes](notes/lesson-3.md)
    - code
        - [lesson3.hoon](gen/lesson3.hoon)
        - [add-sub.hoon](gen/add-sub.hoon)
        - [fact.hoon](gen/fact.hoon)
        - [card-deck.hoon](gen/card-deck.hoon)
        - [sum-of-five.hoon](gen/sum-of-five.hoon)


## Misc

- [Pronouncing Hoon](pronouncing-hoon.md)

## Setup

```bash
$ git clone https://git.sr.ht/~talfus-laddus/hoon-school
$ urbit -F $HOME/projects/zod
> |mount %base  :: create %base folder on earth
```

## Usage

Start continuous synchronisation between the git repository's `gen` directory and the `%base` desk's `gen` directory:
```bash
./sync.sh
```

Then run the fake ship and `commit` the files:
```bash
$ urbit $HOME/projects/zod
> |start %language-server
> |commit %base  :: sync %base desk with earth directly
```

Finally execute a hoon program:
```dojo
> +list 5
``
