--Code files from lecture 4
--Higher order functions


import Prelude hiding (map,filter,sum,product,concat,foldr,
                       takeWhile,dropWhile,lines,unlines)


-- * First some examples of first order functions on lists

sum :: Num a => [a] -> a
sum []      = 0
sum (x:xs)  = x + sum xs

product :: Num a => [a] -> a
product []      = 1
product (x:xs)  = x * product xs



-- concat :: [[a]] -> [a]


-- * Factor out the differences from the common pattern

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr op base [] = base
foldr op base (x:xs) = x `op` foldr op base xs 


-- map :: (a->b) -> [a] -> [b]

-- filter :: (a->Bool) -> [a] -> [a]

-- * Can we rewrite map & filter too with foldr?

--map'

--filter'

-- * More examples

-- takeLine

-- takeWord

-- takeWhile

-- dropWhile

-- lines

-- segments


-- * A larger example: counting words in a string
-- and produce nicely formatted output,
-- written in "point-free style"

-- countWords :: String -> String
