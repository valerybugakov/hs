import Data.Function

test :: a -> a -> b -> a
test a b c = id a

mono :: Char -> Char
mono x = x

semiMono :: Char -> a -> Char
semiMono x y = x

-- multiply second values of two pairs
multSecond = (*) `on` (\p -> snd p)

-- on3 implementation
on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z = op (f x) (f y) (f z)

-- sum first elements of pair of pairs
sumFstFst = (+) `on` (fst . fst)

-- using composition
doItYourself = f . g . h

h x = max x 42
g x = x ^ 3
f x = logBase 2 x
