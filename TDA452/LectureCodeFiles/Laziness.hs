-- | Laziness
-- Examples to illustrate laziness and infinite data structures
-- Functional Programming course 2016.
-- Thomas Hallgren

{-
This is just a skeleton, the definitions will be filled in
during the lecture.
-}
module Laziness where
import Prelude hiding (take,zip)
import qualified Prelude as P
import Data.List(sort)
import Test.QuickCheck


--------------------------------------------------------------------------------
-- * First examples

ite b x y = if b then x else y

f n = ite (n==0) 1000 (10 `div` n)

--------------------------------------------------------------------------------
-- * Infinite lists

ones :: [Int]
ones = 1 : ones

numbers :: [Integer]
numbers = [1..]

countUp :: Int -> [Int]
countUp n = n:countUp(n+1)

fromTo :: Int -> Int -> [Int]
fromTo start stop = P.take (stop-start) (countUp start)

--------------------------------------------------------------------------------
-- * Fibonacci numbers

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

--------------------------------------------------------------------------------
-- * Primes

primes :: [Integer]
primes = sieve [2..]
  where
    sieve (p:xs) = p:sieve[x | x <- xs, x `mod` p /= 0]

ex1 = P.take 20 primes
ex2 = P.takeWhile (<100) primes


--------------------------------------------------------------------------------
-- * Newtons method

sqroot x = undefined
  where
    as = undefined  -- infinite list of improving approximations
    next a = (a+x/a)/2 -- next approximation

--------------------------------------------------------------------------------
-- * prop_zip_length problem

-- | zip [1,2,3] "abcde" == [(1,'a'),(2,'b'),(3,'c')]
zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys) = (x,y):zip xs ys
zip _      _      = []

prop_zip_length_v1 xs ys = undefined

zip_ex = zip [1..] "Haskell"
test_zip = prop_zip_length_v1 [1..] "Haskell"

--------------------------------------------------------------------------------

-- | A type for (lazy) natural numbers ℕ
data Nat = Z | S Nat  deriving (Eq,Ord,Show)


infinity :: Nat
infinity = undefined

--five =

len :: [a] -> Nat
len = undefined

--------------------------------------------------------------------------------
-- * prop_zip_length problem solved

prop_zip_length xs ys = undefined

--------------------------------------------------------------------------------
-- * More examples with natural numbers

power :: Integer -> Nat -> Integer
power = undefined

take :: Nat -> [a] -> [a]
take = undefined

fromNat :: Num a => Nat -> a
fromNat = undefined

-- instance Num Nat where ...

--------------------------------------------------------------------------------
-- * Search example

-- | search p returns Just n, if n is the smallest Nat such that p n is True
--            returns Nothing, if p n is false for all n::Nat
search :: (Nat->Bool) -> Maybe Nat
search p = undefined

--------------------------------------------------------------------------------
-- * Fringe example

data Tree a = L a | Tree a :+: Tree a
            deriving (Eq,Show)

-- | Tree equality (same shape, same leaves)
eqTree :: Eq a => Tree a -> Tree a -> Bool
eqTree = undefined

-- | Fringe equality
-- (The trees have the same sequence of leaves, but can have different shape)
eqFringe :: Eq a => Tree a -> Tree a -> Bool
eqFringe = undefined


rFringe :: [a] -> Gen (Tree a)
rFringe = undefined

--------------------------------------------------------------------------------
-- * Lazy IO

countLines :: FilePath -> IO Int
countLines filename =
  undefined

sortFile :: FilePath -> IO ()
sortFile filename =
  undefined
