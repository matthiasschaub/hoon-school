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
  ::    sum expenses of all plots
  ::
  ::  create a map
  ::
  %+  roll  a
    |=  [[p=@p q=@] counts=(map @p @)]
    (~(put by counts) p (add (~(gut by counts) p 0) q))
++  splt
  ::   split expenses
  ::
  ~
--
