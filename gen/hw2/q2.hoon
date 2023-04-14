::
::    Q2
::
::        > =reagent -build-file %/gen/hw2/q2/hoon
::        > (weekly-reagent:reagent ~[1 1 1 1 1 1 1])
::
|%
  ++  weekly-reagent
    |=  elements=(list @ud)
    =/  sum  0
    =/  counter  0
    |-
    ?:  =(counter 7)
      sum
    %=  $
      counter  (add counter 1)
      sum  (add (snag counter elements) sum)
    ==
  --
