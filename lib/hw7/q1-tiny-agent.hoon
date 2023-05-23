::
::  Usage:
::      > =tiny-agent -build-file %/lib/hw7/q1-tiny-agent/hoon
::      > =agent ~(on-init tiny-agent 10)
::      > =agent (on-poke:agent [%add 5])
::      > =agent (on-poke:agent [%sub 1])
::      > =agent (on-poke:agent [%sub 2])
::      > =agent (on-poke:agent [%add 13])
::      > =agent (on-poke:agent [%add 4])
::      > on-peek:agent
::
/+  number-to-words
|_  balance=@ud
++  on-init
  |=  a=@ud
  .(balance a)
++  on-poke
  |=  [mark=?(%add %sub) a=@ud]
  ?-  mark
    %add  .(balance (add balance a))
    %sub  .(balance (sub balance a))
    ==
++  on-peek
  `tape`(need (to-words:eng-us:numbers:number-to-words balance))
--
