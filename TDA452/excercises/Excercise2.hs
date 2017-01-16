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


hanoi :: Integer -> Integer
hanoi 1 = 1
hanoi n = 1 + 2 * hanoi (n-1)

--4) fibonacci
fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

--factors
smallestFactor  :: Int -> Int
smallestFactor 0 = 0;
smallestFactor n = nextFactor n 1

prop_smallestFactor :: Int -> Bool
prop_smallestFactor n = (nextFactor n 1) == smallestFactor n


nextFactor :: Int -> Int -> Int
nextFactor n k
    | k > n = n
    | n == (k+1) = 1
    | n `mod` (k+1) == 0 = (k+1)
    | otherwise = nextFactor n (k+1)


-- 6 Multiplying list elements
data List a = Empty | Add a (List a)

multiply :: List Integer -> Integer
multiply Empty = 1
multiply (Add n xs )= n * multiply xs


-- 7 Avoiding Duplicates
duplicates :: Eq a => [a] -> Bool
duplicates [] = False
duplicates n = (length (removeDuplicates n)) > 0

removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs)
          | elem x xs = removeDuplicates (x:(removeDuplicates xs))
          | otherwise = removeDuplicates xs


prop_duplicatesRemoved :: [Integer] -> Bool
prop_duplicatesRemoved xs = not (duplicates (removeDuplicates xs))
