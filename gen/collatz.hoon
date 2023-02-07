::
::    the Collatz conjecture
::
::  https://en.wikipedia.org/wiki/Collatz_conjecture
::
::  n/2    if n=0 (mod 2)
::  3*n+1  if n=1 (mod 2)
::
|=  n=@u                          :: gate  (function)
^-  [@u @u]                       :: fence (return type)  of a cell of two atoms
=/  m  n                          :: face  (variable)     of maximal value
=/  i  0                          :: face                 of control variable
|-                                :: trap  (recursion point)
?:  =(n 1)                        :: conditional
   [i m]                          ::       (return value) of a cell of two atoms
?:  =((mod n 2) 0)                :: conditional
  %=  $                           :: resolve wing (data reference) with changes
    n  (div n 2)
    m  (max m n)
    i  +i
  ==
%=  $                             :: resolve wing (data reference) with changes
  n  (add (mul n 3) 1)
  m  (max m n)
  i  +i
==
