|%
++  euler-primes
  |=  n=@ud
  ^-  (list @ud)
  =/  k  1
  =/  out  *(list @ud)
  |-
  ?:  .=  (dec n)  k
    out
  %=  $
    k  .+  k
    out  (snoc out (add (sub (mul k k) k) n))
  ==
--
