::
::    Q5
::
::        > +hw2/q5 `(list @)`~[1 2]
::
|=  in=(list @)
^-  (list @)
=/  out  *(list @)       :: bunt value (default value)
=/  counter  (lent in)
|-                       :: trap (recursion point)
?:  .=  counter  0       :: condition
  out
%=  $
  counter  (dec counter)
  ::  snag: index
  ::  snoc: append
  ::
  out  (snoc out (snag (dec counter) in))
==
