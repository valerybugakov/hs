module Fibonacci where

fib :: Integer -> Integer

-- Body recursion

fib 0 = 0
fib 1 = 1
fib n | n > 1 = fib(n - 1) + fib(n - 2)
      | n < 0 = (if even n then -1 else 1) * fib(abs n)

-- Tail recursion

fibAcc n | n >= 0 = h' n 0 1
         | n < 0 = (if even n then -1 else 1) * fibAcc(- n)

h' 0 a1 a2 = a1
h' n a1 a2 = h' (n - 1) a2 (a1 + a2)

-- Tail recursion custom

fibAcc' 0 = 0
fibAcc' 1 = 1
fibAcc' n | n > 1 = hh 0 1 2 n
               | n < 0 = (if even n then -1 else 1) * fibAcc'(- n)

hh a1 a2 i end | i == end  = a1 + a2
               | otherwise = hh a2 (a1 + a2) (i + 1) end
