# Homework 1 - Answers

> Each paragraph is an answer to a question.

```hoon
~talfus-laddus

788.267.426

0x2efc.01a2

:-  1  2

:+  'a'  'b'  'c'

:^  ~zod  ~nec  ~bud  ~wes

=/  three  3  %-  mul  :-  three  three

=/  ten  10  =/  hundred  100  %-  pow  :-  ten  hundred

=/  x  4
?:  %-  gth  :-  x  3
  ?:  %-  lte  :-  x  5
    1
  0
0

=/  x  2
?:  %-  gth  :-  x  2
  ?:  %-  lte  :-  x  3
    %-  sub  :-  x  2
  ?:  %-  gth  :-  x  3
    ?:  %-  lte  :-  x  4
      %-  sub  :-  4  x
    0
  0
0
```
