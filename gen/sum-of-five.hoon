:: This program adds 1+2+3+4+5 and returns the sum
::
=/  counter  1
=/  sum  0
:: Recursion point
::
|-
?:  (gth counter 5)
  sum
%=  $
  counter  (add counter 1)
  sum      (add sum counter)
:: Rune terminator
::
==
