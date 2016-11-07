-- | Working with List
-- Examples to illustrate pattern matching, recursion and testing for lists
-- Functional Programming course 2016.
-- Thomas Hallgren

{-
This started out as a skeleton, the definitions were filled in
during the lecture.
-}

import Prelude hiding ((++),reverse,take,drop,splitAt,zip,unzip)
import qualified Prelude

import Test.QuickCheck


--(++) :: [a] -> [a] -> [a]

--cons x xs
--snoc xs x

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
