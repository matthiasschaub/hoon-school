:: /gen/splitter.hoon
::
:: Split a long "tape" into words at spaces
::
|=  ex=tape
=/  index  0
=/  result  *(list tape)
|-
?:  =(index (lent ex))
  (weld result ~[ex])
?:  =((snag index ex) ' ')
  :: deal w/ word break
  ::
  %=  $
    index  +(index)
    result  (weld result ~[`tape`(scag index ex)])
    ex  `tape`(slag +(index) ex)
  ==
:: otherwise just count up
::
$(index +(index))
