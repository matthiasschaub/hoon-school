|%
++  factorial
  |=  n=_1
  ^-  @ud
  ?:  .=  n  0
    n
  |-
  ?:  .=  n  1
    n
  %+  mul
  n
  %=  $
    n  (dec n)
  ==
--
