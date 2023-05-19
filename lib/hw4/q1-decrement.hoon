|%
++  decrement
  |=  n=@ud
  ^-  @ud
  ?:  .=  n  0
    n
  =/  c  0
  |-
  ?:  .=  .+  c  n
    c
  %=  $
    c  .+  c
  ==
--
