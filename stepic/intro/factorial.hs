module Factorial where

factorial' n
  | n >= 0 = let
      helper acc 0 = acc
      helper acc n = helper (acc * n) (n - 1)
    in helper 1 n
  | otherwise = error "arg must be >= 0"

factorial n | n >= 0 = helper 1 n
            | otherwise = error "arg must be >= 0"

helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)

-- factorial 0 = 1
-- factorial n | n < 0 = error "arg must be >= 0"
--             | otherwise = n * factorial (n - 1)

-- factorial n
--   | n == 0 = 1
--   | n < 0 = error "arg must be >= 0"
--   | otherwise = n * factorial (n - 1)

-- factorial 0 = 1
-- factorial n = if n < 0 then erorr "arg must be >= 0" else n * factorial (n - 1)

-- factorial n = if n == 0 then 1 else n * factorial(n - 1)

-- One liner with guards
-- lol n | n >= 0 = print "lol" | otherwise = print "nope"
