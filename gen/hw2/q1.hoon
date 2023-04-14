::
::    Q1
::
::        > =scale -build-file %/gen/hw2/q1/hoon
::        > (corrected-weight:scale 11)
::
|%                      :: a core
  ++  corrected-weight
    |=  measurement=@ud :: a gate
    ^-  @ud             :: a fence
    ?:  (gth measurement 10)
      measurement
    0
  --
