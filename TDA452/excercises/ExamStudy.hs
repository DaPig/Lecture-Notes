-- Pieces of code to try out parts of the "learnyouahaskell" tutorial
import Test.QuickCheck
import Data.List

-- testing map
addThreeMap :: Num a => [a] -> [a]
addThreeMap [] = []
addThreeMap x = map (+3) x

prop_addThreeMap :: (Num a,Eq a) => [a] -> Bool
prop_addThreeMap [] = True
prop_addThreeMap x = (head (addThreeMap x)) == ((head x) +3)


-- filter

biggerThanThree :: (Num a,Ord a) => [a] -> [a]
biggerThanThree [] = []
biggerThanThree x = filter (>3) x

prop_biggerThanThree :: (Num a, Eq a, Ord a) => [a] -> Bool
prop_biggerThanThree [] = True
prop_biggerThanThree x
              | length lst > 0 = (head (sort lst) > 3)
              | otherwise = True
              where
                lst = biggerThanThree x


--Lambdas
addTuples :: (Num a) => [(a,a)] -> [a]
addTuples [] = []
addTuples x = map (\(a,b) -> a+b) x

-- Foldr/foldl
sumSqr :: Num a => [a] -> a
sumSqr x =  foldl (\acc x -> (x*x) + acc) 0 x

sumDiv ::[Double] -> Double
sumDiv x = foldr (\x acc -> (sqrt x) + acc) 0 x

-- Dunction decomposition
sumSqrSqare :: Num a => [a] -> a
sumSqrSqare x = (square . sumSqr ) x
  where
    square x = x*x

-- data types
data Joke = Funny | NotFunny

instance Eq Joke where
  Funny == NotFunny = False

instance Show Joke where
  Funny = "Good, your joke was funny"
  NotFunny = "Just kidding, my jokes are always funny"

--- List comprehentions

placeInWord :: String -> -> [Char] [Int]
placeInWord str chars = [i | (i,c) <- zip [0..] n, c `elem` chars ]
