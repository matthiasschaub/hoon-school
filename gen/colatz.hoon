::
::    the Collatz conjecture
::
::  https://en.wikipedia.org/wiki/Collatz_conjecture
::
::  n/2    if n=0 (mod 2)
::  3*n+1  if n=1 (mod 2)
::
|=  n=@u                          :: gate (function)
^-  [@u @u]                       :: fence (return type)
=/  m  n                          :: face (variable): maximal value
=/  i  0                          :: face (variable): control variable
|-                                :: trap (recursion point)
~&  n                             :: debugging printf
?:  =(n 1)
   [i m]                          :: return
?:  =((mod n 2) 0)
  %=  $                           :: resolve wing (data reference) with changes
    n  (div n 2)
    m  (max m n)
    i  (add i 1)
  ==
%=  $                             :: resolve wing (data reference) with changes
  n  (add (mul n 3) 1)
  m  (max m n)
  i  (add i 1)
==
