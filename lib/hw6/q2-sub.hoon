|%
++  sub
  ::    unsigned subtraction
  ::
  ::  a: minuend
  ::  b: subtrahend
  |=  [a=@ b=@]
  ::  difference
  ^-  @
  ?.  =(0 b)  $(a (dec a), b (dec b))
  a
--
