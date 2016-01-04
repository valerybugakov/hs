-- Implement a function, which returns sum and
-- number of digits of the given integer

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = (s,l) where
  (s,l) = helper 0 0 (abs x)
  helper 0 0 0 = (0,1)
  helper s l 0 = (s,l)
  helper s l n = helper (s + r) (l + 1) q where
    (q,r) = divMod n 10

