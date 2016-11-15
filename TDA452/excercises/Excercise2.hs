--1) THe maximum function
--when x and y is equal, return x
import Test.QuickCheck

maxi :: Integer -> Integer -> Integer
maxi x y  | x > y = x
maxi x y  | x==y = x
          | otherwise = y

prop_maxi :: Integer ->  Integer  -> Bool
prop_maxi x y | x==y = (maxi x y) == x
prop_maxi x y | x > y =  (maxi x y) == x
              | otherwise = maxi x y == y


-- 2) Sum of squares
sumsq :: Integer -> Integer
sumsq n = (n*n) + sumsq(n-1)

-- Cannot get this to work
--prop_sumsq :: Integer -> Bool
--prop_sumsq n = sumsq n == n (n+1) (2n + 1) / 6v


-- 3) The towers of hanoi
-- hanoi :: Integer -> Integer
-- hanoi n = hanoi

--4) fibonacci
fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)
