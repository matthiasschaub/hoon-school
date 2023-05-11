# Hoon School (hsl-2023.3)

Notes on learning [Hoon](https://developers.urbit.org/reference/hoon/overview).

A lot of the definitions and code examples are taken directly from either the [official documentation on Hoon](https://developers.urbit.org/reference/hoon/overview) or from the [Hoon School curriculum](https://developers.urbit.org/guides/core/hoon-school/A-intro).

## Notes

The git repository with the code (generators `gen/` and libraries `lib/`) related to the lessons, notes and homework's can be found [here](https://git.sr.ht/~talfus-laddus/hoon-school).

Main concepts:
1. [Hoon syntax, expressions (`hoon` and `rune`), values (`atom` and `cell`), data types (`aura`) and branching](notes/1-hoon-rune-atom-cell-aura.md)
2. [Irregular syntax, functions (`gate`), types, structures (`mold`) and programs (`generator`)](notes/2-gates-molds-generators.md)
3. [Binary trees and addresses](notes/3-tree-addresses.md)
4. [Cores and recursion (`trap`)](notes/4-cores-recursion.md)
5. [Lists and text (`cord`, `knot`, `term`, and `tape`)](notes/5-text-lists.md)
6. [More on cores and doors](notes/6-cores-doors.md)
7. [Maps](notes/7-maps.md)

Additional notes:
8. [Assertions and errors](notes/asserts-errors.md)
6. [Libraries and desks](notes/libraries-desks.md)
7. [Debugging](notes/debug.md)

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
```

## Resources

- [Pronouncing Hoon](pronouncing-hoon.md)
- [Urbit Userspace Style Guide](https://www.ajlamarc.com/blog/2023-02-26-urbit-style/)
- [Tlon Bouncer](https://github.com/tloncorp/bouncer)
    - Connects to a running ship and runs a customizable script to merge, mount, rsync, commit, and install.
