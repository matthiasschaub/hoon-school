:-  %say
|=  [[now=@da eny=@uvJ bec=beak] [sides=@ud ~] [rolls=@ud ~]]
:-  %noun
=/  counter  0
=/  results  *(list @ud)
=/  rng  ~(. og eny)
|-
?:  =(counter rolls)
  results
=^  r  rng  (rads:rng sides)
%=  $
  results  (snoc results +(r))
  counter  +(counter)
==
