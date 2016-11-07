--Code file for the third lecture
  --of Functional Programming 07/11 -16


import Prelude hiding ((++),reverse,take,drop,splitAt,zip,unzip)
--The above hides the standard functions defined.
-- this gives us the opportunity to implement them ourselves
import qualified Prelude

import Test.QuickCheck


(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
[x:xs] ++ ys = x: (xs ++ys)

cons x xs
snoc xs x

--reverse :: [a] -> [a]
-- complexity? how to make it more efficient?

-- | Take the first n elements of a list
--take :: Int -> [a] -> [a]

--prop_take n xs =
-- | Discard the first n elements of a list
--drop :: Int -> [a] -> [a]

--prop_take_drop n xs =

--nonprop_take_drop n xs =


-- | splitAt n xs = (take n xs,drop n xs)
--splitAt :: Int -> [a] -> ([a],[a])

-- Combine a pair of list into a list of pairs
--zip :: [a] -> [b] -> [(a,b)]


-- Split a list of pairs into a pair of lists

--unzip :: [(a,b)] -> ([a],[b])

--prop_zip_unzip xys

--prop_unzip_zip xs ys

-- | insert a new element at the right position in a sorted list
--insert :: Ord a => a -> [a] -> [a]

--prop_insert x xs

-- | Insertion sort (sort a list by using insert)
--isort :: Ord a => [a] -> [a]


-- | "Quicksort"
--qsort :: Ord a => [a] -> [a]


--prop_qsort xs =