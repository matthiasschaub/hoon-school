# Hoon School (hsl-2023.3)

Notes on learning [Hoon](https://developers.urbit.org/reference/hoon/overview).

A lot of the definitions and code examples are taken directly from either the [official documentation on Hoon](https://developers.urbit.org/reference/hoon/overview) or from the [Hoon School curriculum](https://developers.urbit.org/guides/core/hoon-school/A-intro).

## Lessons and Homeworks

The git repository with the code related to the lessons can be found [here](https://git.sr.ht/~talfus-laddus/hoon-school).

1. Hoon syntax, expressions (`hoon` and `rune`), values (`atom` and `cell`), data types (`aura`) and branching.
    - [lesson 0 & 1](lessons/hsl-1.md)
    - [homework 0](homeworks/hw-0.md)
    - [homework 1](homeworks/hw-1.md)
2. Irregular syntax, functions (`gate`), types, structures (`mold`) and programs (`generator`).
    - [homework 2](homeworks/hw-2.md)
    - [lesson 2](lessons/hsl-2.md)
    - code
        - [branch.hoon](gen/two/branch.hoon)
3. Binary trees, recursion (`trap`) and cores.
    - [lesson 3 on binary trees](lessons/hsl-3-1.md)
    - [lesson 3 on recursion and cores](lessons/hsl-3-2.md)
    - code
        - [card-deck.hoon](gen/three/card-deck.hoon)
        - [number-to-words.hoon](lib/number-to-words.hoon)
        - [sum-of-five.hoon](gen/three/sum-of-five.hoon)
        - [fact.hoon](gen/three/fact.hoon)
        - [add-sub-one.hoon](gen/three/add-sub-one.hoon)
        - [collatz.hoon](gen/three/collatz.hoon)
4. Text (`cord`, `knot`, `term`, and `tape`), lists and libraries.
    - [lessons 4 on text and lists](lessons/hsl-4-1.md)
    - [lessons 4 on libraries](lessons/hsl-4-2.md)
    - code
      - [splitter.hoon](gen/four/splitter.hoon)
      - [ntw.hoon](gen/four/ntw.hoon)
5. Libraries, desks, cores and search paths.
    - [lesson 5](lessons/hsl-5.md)
6. Assertions, errors, `doors` and maps.
    - [lesson 6](lessons/hsl-6.md)

## Resources

- [Pronouncing Hoon](pronouncing-hoon.md)
- [Urbit Userspace Style Guide](https://www.ajlamarc.com/blog/2023-02-26-urbit-style/)
- [Tlon Bouncer](https://github.com/tloncorp/bouncer)
    - Connects to a running ship and runs a customizable script to merge, mount, rsync, commit, and install.

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
