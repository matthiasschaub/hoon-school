::
::    Q4
::
::        > +hw2/q4 `(list @)`~[1 2]
::
|=  in=(list @)
^-  (list @)
=/  length  (lent in)
=/  out  *(list @)       :: bunt value (default value)
=/  counter  0
|-                       :: trap (recursion point)
?:  .=  counter  length  :: condition
  out
%=  $
  counter  (add counter 1)
  ::  snag: index
  ::  snoc: append
  ::
  out  (snoc out (add (snag counter in) 1))
==
