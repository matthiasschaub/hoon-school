|=  n=@ud
:: compose two expressions
::
=>
:: define a core with two arms
::
|%
++  add-one
  |=  a=@ud
  ^-  @ud
  %:  add  a  1  ==
++  sub-one
  |=  a=@ud
  ^-  @ud
  %:  sub  a  1  ==
--
:: calls the gate add-one defined in the core above
::
%:  add-one  n  ==
