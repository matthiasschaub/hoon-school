::  Boxcar Function
::
::  Takes an unsigned decimal number as input (x) and produces:
::      1 if 3 < x <= 5
::      0 otherwise
::
::  Usage:
::      +boxcar 5
|=  x=@ud
^-  @
?:  %-  gth  :-  x  3
  ?:  %-  lte  :-  x  5
    1
  0
0
