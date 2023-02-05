::    split shared expenses
::
::  dojo:
::      > =splt -build-file %/lib/splt-exps/hoon
::      > =exps ini:splt
::      > (add:splt exps 2)
::
|%
+$  ex   [plot=@ud val=@ud]
+$  exs  (list ex)
++  ini
  ^-  exs
  *exs
++  add
  ::    add expense to all expenses
  ::
  |=  [exps=exs exp=ex]
  ^-  exs
  (snoc exps exp)
++  sum
  ::    sum expenses of one plot
  ::
  |=  val=@ud
  ^-  @ud
  val
 ++ splt
  ::   split expenses
  ::
  |=  val=@ud
  ^-  @ud
  val
--
