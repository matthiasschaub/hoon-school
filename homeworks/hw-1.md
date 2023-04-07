# HSL ~2023.3 %hw1

Homework #1 for Hoon School Live.

You have now learned how to use irregular syntax for Hoon runes, and should think about how to employ it when convenient.

You have learned about the following runes:

- `^+` ketlus, for enforcing a type (like `^-` but with an example)
- `^*` kettar, for producing an example (a bunt)
- `!>` zapgar, for ascertaining the type of a value
- `|=` bartis, for creating a gate
- `::`, for commenting on code

Not covered in the live lesson but in the notes:

- `$?` bucwut, for producing a type union
- `$:` buccol, for producing a named tuple
- `!!` zapzap, for crashing or stubbing out incomplete branches of your Hoon expressions
- `/+` faslus, for importing a library of code


## Irregular Syntax
Many runes have irregular syntax.  This can make it easier to write aesthetically expressive Hoon code.

- Q1. Convert the irregular form `[1 2 3 4]` to a regular form.
- Q2. Convert the irregular form `(mul 10 5)` to a regular form.
- Q3. Convert the regular form `^-  @ud  ^-  @  'Mars'` to an irregular form.

*Answers:*
```hoon
:^  1  2  3  4

%-  mul  :-  10  5

`@ud`'Mars'
```

## Molds

Molds define Hoon structures.  They have a default value (“bunt”) and are strictly statically typed (i.e. they must match).

Q4. What is the bunt of `@da`?

Q5. What is the bunt of `@uc`?

Q6. What is the bunt of `@da` as a `@ud`?  (I.e., bunt it then convert that value to @ud.)

Q7. What is the bunt of `cell`?  (I.e. there is a type in Hoon named `cell`, do it of that.)

Q8. Produce a type union which can accept a signed or unsigned decimal integer.  (ETA:  actually not a good question since type unions can't distinguish auras, do it for practice but I'll have to take this one out next time around)

Q9. Produce a named tuple with three elements `x`, `y`, and `z`, all of type `@rs` (real number, number with a fractional part).

Q10. What does the infixed `^` ket do?  E.g., `4^5`.  (Infer from its behavior in the Dojo.)

*Answers:*
```hoon
~2000.1.1

0c1111111111111111111114oLvT2

170.141.184.492.615.420.181.573.981.275.213.004.800

#t/[* *]

> $?  @ud  @  ==
< 1.jyg
  [ *
    [our=@p now=@da eny=@uvJ]
    <17.bix 35.nnx 14.mmr 54.ylx 77.ifr 233.ork 51.enr 137.yvb 33.sam 1.pnw %139>
  ]

[x=.1.5 y=.0.5 z=.2]

Construct an n-tuple (cell).
```

## Deferring Computation

A gate (made with `|=` bartis) lets you store a computation for future use.
You can store a gate as a standalone reusable file called a generator.

Q11. Take your code for the boxcar function in the previous homework.  Produce a gate which works for any `@ud` input value `x`.  (Your answer should just be that gate, `|=` onwards.)

Q12. Take your code for the boxcar function gate in the previous question.  Produce a generator from the gate named `boxcar.hoon`.  Don't forget to add at least one comment to explain its intent.  (Your answer will be very similar to the answer for Q11.)

Q13. Write a generator which accepts the value of a planet as a `@p` and returns the next neighbor, also as a `@p`.  The next neighbor of a planet is calculated by incrementing the numeric value of the planet's address by one.  You will then need to convert it from `@ud` back to `@p`.  (You don't need to filter for planet input or anything, just for `@p`.)  For instance, the next neighbor of ~sampel-palnet is ~radbyr-fonlyr.

Q14. What are your biggest remaining concerns, points of misunderstanding or fuzzy understanding, or other feedback on hsl1?

*Answers:*
```hoon
::  Boxcar Function
::
::  Takes an unsigned decimal number as input (x) and produces:
::      1 if 3 < x <= 5
::      0 otherwise
::
::  Usage:
::      +boxcar 5
|=  x=@ud
^-  @
?:  %-  gth  :-  x  3
  ?:  %-  lte  :-  x  5
    1
  0
0
```

```hoon
::  Get the neighbor of a planet
::
|=  planet=@p
^-  @p
.+  ^-  @  planet
```
