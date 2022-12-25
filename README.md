# Hoon School Generators

Notes on learning [Hoon](https://developers.urbit.org/reference/hoon/overview).

## Lessons

The git repository with the code related to the lessons can be found [here](https://git.sr.ht/~talfus-laddus/hoon-school).

- (0): [Pronouncing Hoon](pronouncing-hoon.md)
- (1) and (2): Irregular syntax, Urbit types, gates and generators
  - [notes](notes/lesson-1-2.md)
  - code
    - [branch.hoon](gen/branch.hoon)
- (3): Recursion, cores and binary trees
  - [notes](notes/lesson-3.md)
  - code
    - [lesson3.hoon](gen/lesson3.hoon)
    - [add-sub.hoon](gen/add-sub.hoon)
    - [fact.hoon](gen/fact.hoon)
    - [card-deck.hoon](gen/card-deck.hoon)
    - [sum-of-five.hoon](gen/sum-of-five.hoon)

## Setup

```bash
git clone https://git.sr.ht/~talfus-laddus/hoon-school
urbit -F $HOME/projects/zod
~zod:dojo> |mount %base
```

## Usage

Start continuous synchronisation between this `gen` directory and the `%base` desks `gen` directory:
```bash
./sync.sh  # to sync gen repo to fake zod
```

Then run the fake ship and `commit` the files:
```bash
urbit $HOME/projects/zod
~zod:dojo> |commit %base
```

Finally execute a hoon program:
```bash
~zod:dojo> +list 5
```
