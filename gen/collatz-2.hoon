|= (collatz n)
  |% (~ % 2) 1 =
  [ [n (* n 3) (+ n 1)] collatz]
  [ [n (/ n 2)] collatz]
