::  tests for splt-exps
::
/+  splt-exps
::
|%
++  test-add
  %+  expect-eq
  !>  (add [[~zod 1] [~pub 2] [~zod 3] ~] ~zod 1)
  !>  [[~zod 1] [~pub 2] [~zod 3] [~zod 1]~]
:: TODO
:: ++  test-sum
::   %+  expect-eq
::   !>  (sum [[~zod 1] [~pub 2] [~zod 3] ~])
::   !>  `(map @p @)`
--
