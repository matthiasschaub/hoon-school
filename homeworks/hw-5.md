# HSL ~2023.3%hw5

> Homework #5 for Hoon School Live.

Let's use doors to build some new tools.

You have learned about the following runes:

- `?>` wutgar, branch on a positive assertion
- `?<` wutgal, branch on a negative assertion
- `?~` wutsig, branch on a null result
- `+$` lusbuc, produce a type builder arm

## Q1

Produce a Hoon expression which makes a map containing Shakespeare characters as keys and the corresponding play as the value.  (This does not need to be a jar; you can just include one play for characters that recur in multiple plays.)  You may use ++my or ++put:by or another means to construct the map.  Make sure it has at least four elements.

### Answer

```hoon
(malt `(list (pair @tas tape))`~[[%lucius "Titus Andronicus"] [%quintus "Titus Andronicus"] [%achilles "Troilus and Cressida"] [%hector "Troilus and Cressida"]])
```

## Caesar Cipher

The Caesar cipher code is an excellent example of an Urbit generator built with many arms.  You should closely read it, and I recommend even printing or drawing it and putting arrows to track its behavior.


## Q2

Extend the generator to allow for use of characters other than a-z.  It should also permit characters .,;:'" and you may have it rotate those the same way as letters are rotated.

## Q3

Build a gate that can take a Caesar-shifted tape and produce all possible unshifted tapes as a list of tapes.  This should be performed using the original a-z only cipher.
