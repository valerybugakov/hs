-- Implement a function seqA, wich returns the elements
-- of the following recurrent sequence
-- a0 = 1; a1 = 2 a2 = 3 a(n + 3) = a(n + 2) + a(n + 1) - 2an

seqA :: Integer -> Integer
seqA 0 = 1
seqA 1 = 2
seqA 2 = 3
seqA n
  | n > 2 = let 
      helper 2 a _ _ = a
      helper n a b c = helper (n - 1) (a + b - 2 * c) a b
    in helper n 3 2 1
  | otherwise = error "args must be > 0"

seqA' :: Integer -> Integer
seqA' 0 = 1
seqA' 1 = 2
seqA' 2 = 3
seqA' n
  | n > 2 = seqA'(n - 1) + seqA'(n - 2) - 2 * seqA'(n - 3)
  | otherwise = error "nope"
