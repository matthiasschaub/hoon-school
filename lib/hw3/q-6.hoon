|%
++  split-tape
  |=  input=tape
  ^-  (list tape)
  |-  ^-  (list tape)
  =/  index  0
  =/  result  *(list tape)
  |-  ^-  (list tape)
  ?:  =(index (lent input))
    result
  ?:  =((snag index input) ' ')
    $(index 0, input `tape`(slag +(index) input), result (weld result ~[`tape`(scag index input)]))
  $(index +(index))
++  count-elements
  |=  input=(list)
  =/  counter  0
  ^-  @
  |-
  ?~  input
    counter
  $(counter +(counter), input t.input)
--
