-- Excercise 3: List comprehentions
import Data.List

drop' :: Int -> [a] -> [a]
drop' 0 _  = []
drop' _ [] = []
drop' n (x:xs) | n > 0 = (x:(drop (n-1) xs))
drop' _ _ = error "Negative argument"

--- 1 Permutation
isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation [] [] = True
isPermutation [] _  = False
isPermutation _ []  = False
isPermutation (x:xs) (y:ys) | x == y = isPermutation xs ys

--- 4 Erastosthenes' sieve
crossOut :: Int -> [Int] -> [Int]
crossOut m ns = [n | n <- ns, n `mod` m /= 0]

sieve :: [Int] -> [Int]
sieve [] = []
sieve (x:xs) = (x:sieve(crossOut x xs))
