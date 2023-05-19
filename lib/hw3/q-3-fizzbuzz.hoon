|%
++  fizz
  :: Q3. FizzBuzz is a classic computer science challenge question.  For this step, write a gate in an arm `++fizz` which accepts a count and counts upward from one to that value, appending the number each time OR "fizz" (as tape) every third number until the count is reached.  (I.e., given 7, it should yield the list ~[1 2 "fizz" 4 5 "fizz" 7].)  (Answer with the arm as the only arm in a regular |% core.)
  |=  n=@ud
  ^-  (list ?(@ud (list @t)))
  =/  out  *(list ?(@ud (list @t)))
  =/  i  1
  |-
  ?:  .=   .+  n  i
    out
  ?:
    .=
      %+  mod  i  3
    0
    %=  $
      i    .+  i
      out  %+  snoc  out  "fizz"
    ==
  %=  $
    i    .+  i
    out  %+  snoc  out  i
  ==
++  buzz
  :: Q4.  For this step, write a gate in an arm `++buzz` which accepts a count and counts upward from one to that value, appending the number each time OR "buzz" (as tape) every fifth number until the count is reached.  (I.e., given 7, it should yield the list ~[1 2 3 4 "buzz" 6 7].)  (Answer with the arm as the second arm after `++fizz` in a regular |% core.)
  |=  n=@
  ^-  (list ?(@ud (list @t)))
  =/  out  *(list ?(@ud (list @t)))
  =/  i  1
  |-
  ?:  .=   .+  n  i
    out
  ?:
    .=
      %+  mod  i  5
    0
    %=  $
      i    .+  i
      out  %+  snoc  out  "buzz"
    ==
  %=  $
    i    .+  i
    out  %+  snoc  out  i
  ==
++  fizzbuzz
  :: Q5. For this step, write a gate in an arm `++fizzbuzz` which accepts a count and counts upward from one to that value, appending the number each time, "fizz" every third number, and "buzz" every fifth number until the count is reached.  (I.e., given 15, the list should count from 1 to 15 thus: ~[1 2 "fizz" 4 "buzz" "fizz" 7 8 "fizz" "buzz" 11 "fizz" 13 14 "fizz buzz"].)  Make sure that it outputs *both* "fizz" and "buzz" for numbers that are divisible by both three and five.  (Answer with the arm as the third arm after `++fizz` and `++buzz` in a regular |% core.)
  |=  n=@
  ^-  (list ?(@ud (list @t)))
  =/  out  *(list ?(@ud (list @t)))
  =/  i  1
  |-
  ?:  .=   .+  n  i
    out
  ?:
    .=
      %+  mod  i  3
    0
    %=  $
      i    .+  i
      out  %+  snoc  out  "fizz"
    ==
  ?:
    .=
      %+  mod  i  5
    0
    %=  $
      i    .+  i
      out  %+  snoc  out  "buzz"
    ==
  %=  $
    i    .+  i
    out  %+  snoc  out  i
  ==
--
