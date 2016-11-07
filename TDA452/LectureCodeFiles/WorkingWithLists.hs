--Code file for the third lecture
  --of Functional Programming 07/11 -16


import Prelude hiding ((++),reverse,take,drop,splitAt,zip,unzip)
--The above hides the standard functions defined.
-- this gives us the opportunity to implement them ourselves
import qualified Prelude

import Test.QuickCheck


(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
xs ++ [] = xs
(x:xs) ++ ys = x:(xs ++ys)

cons x xs = x:xs
snoc xs x = xs ++ [x]

reverse :: [a] -> [a]
reverse []    = []
reverse (x:xs) = reverse xs ++ [x]
-- complexity? how to make it more efficient?

-- | Take the first n elements of a list
take :: Int -> [a] -> [a]
take n _ | n<=0 = []
take _ [] = []
take n (x:xs) = x:take(n-1) xs

prop_take n xs = length (take n xs) == n
-- | Discard the first n elements of a list
drop :: Int -> [a] -> [a]
drop 0 xs = xs
drop n (x:xs) | n>0 = drop (n-1) xs

prop_take_drop n xs = take n xs ++ drop n xs == xs

nonprop_take_drop n xs = drop n xs ++ take n xs == xs


-- | splitAt n xs = (take n xs,drop n xs)
--splitAt :: Int -> [a] -> ([a],[a])

-- Combine a pair of list into a list of pairs
zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys) = (x,y):zip xs ys
zip _       _     = []


-- Split a list of pairs into a pair of lists

unzip :: [(a,b)] -> ([a],[b])
unzip [] = ([],[])
unzip ((x,y):xys) = let (xs,ys) = unzip xys in (x:xs,y:ys)


prop_zip_unzip xys = let (xs,ys) = unzip xys in zip xs ys == xys

prop_unzip_zip xs ys = unzip (zip xs ys) == (xs,ys)

-- | insert a new element at the right position in a sorted list
--insert :: Ord a => a -> [a] -> [a]

--prop_insert x xs

-- | Insertion sort (sort a list by using insert)
--isort :: Ord a => [a] -> [a]


-- | "Quicksort"
--qsort :: Ord a => [a] -> [a]


--prop_qsort xs =
