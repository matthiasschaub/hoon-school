# Hoon School Generators

Notes on learning [Hoon](https://developers.urbit.org/reference/hoon/overview).

## Lessons

The git repository with the code related to the lessons can be found [here](https://git.sr.ht/~talfus-laddus/hoon-school-generators).

- (1) and (2): Irregular syntax, Urbit types, gates and generators
  - [notes](notes/lesson-1-2.md)
  - [gen/branch.hoon](gen/branch.hoon)
- (3): Recursion, cores and binary trees
  - [notes](notes/lesson-3.md)
  - [gen/lesson3.hoon](gen/lesson3.hoon)
  - [gen/add-sub.hoon](gen/add-sub.hoon)
  - [gen/fact.hoon](gen/fact.hoon)
  - [gen/card-deck.hoon](gen/card-deck.hoon)
  - [gen/sum-of-five.hoon](gen/sum-of-five.hoon)

## Misc

- [Pronouncing Hoon](pronouncing-hoon.md)

## Setup

```bash
git clone ...
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
