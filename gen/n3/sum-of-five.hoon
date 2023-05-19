=/  counter  1
=/  sum  0
|-
:: hint: Tell the runtime to make a side effect (print).
:: This is not nock. No change to state.
::
~&  "counter:"
~&  counter
~&  "sum:"
~&  sum
?:  (gth counter 5)
  sum
%=  $
  counter  (add counter 1)
  sum      (add sum counter)
==
