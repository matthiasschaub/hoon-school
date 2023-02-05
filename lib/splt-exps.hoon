::    split shared expenses
::
::  dojo:
::      > =splt -build-file %/lib/splt-exps/hoon
::      > =myexps ini:splt
::      > =myexps (add:splt myexps ~zod 1)
::      > myexps
::
|%
+$  ex   [plot=@p val=@ud]
+$  exs  (list ex)
++  ini
  ::    initialize list of shared expenses
  ::
  ^-  exs
  [[~zod 0] ~]
++  add
  ::    add expense to shared expenses
  ::
  |=  [exps=exs exp=ex]
  ^-  exs
  (snoc exps exp)
++  sum
  ::    sum expenses of one plot
  ::
  :: |=  [exps=exs plot=@p]
  :: ^-  @ud
  :: =/  ssum  0
  :: =/  i    0
  :: |-
  :: ?:  =(i (lent exps))
  ::   ssum
  :: ?:  (test (head (scag i exps)) plot)
  ::   %=  $
  ::   i    +(i)
  ::   ssum  (add (tail (scag i exps)) ssum)
  ::   ==
  :: $(i +(i))
  ~
++  splt
  ::   split expenses
  ::
  ~
--
