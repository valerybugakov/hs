class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y = not (x == y)
  x == y = not (x /= y)

instance Eq Bool where
  True  == True  = True
  False == Flase = True
  _     == _     = False

instance (Eq a, Eq b) => Eq (a,b) where
  p1 == p2 = fst p1 == fst p2 && snd p1 == snd p2
