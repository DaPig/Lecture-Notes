-- January 2016

--1)
--i)
xmas' = putStr . tree
tree n = unlines [cr (n - m) " " ++ cr m " *" | m <- [1..n]]
  where cr k = concat . replicate k


--ii)
prop_splitWhen0 =
  splitWhen (== ';') "A;BB;;DDDD;" == ["A","BB","","DDDD",""]
        && splitWhen (>1) [3,0,1,2,0,0] == [[],[0,1],[0,0]]
        && splitWhen (>1) [] == [[]]

splitWhen :: (a->Bool) -> [a] -> [[a]]
splitWhen f x = case span (not . f) x of
  (c, []) -> [c]
  (c,r) ->  c : splitWhen f (drop 1 r)

--iii)
prop_splitWhen :: (a -> Bool) -> [a] -> Bool
prop_splitWhen p xs = length (filter p xs) + 1 == length ( splitWhen p xs)


--2)

data Tree a = Leaf | Node a (Tree a) (Tree a)
deriving Show

balTree :: Gen (Tree Bool)
balTree = sized bTree

bTree :: Int -> Gen (Tree Bool)
bTree n |n<1 = Leaf
        | otherwise = do
          a <- arbitrary
          let m = n-1
          (leftHeight,rightHeight) <- elements((m,m-1),(m-1,m),(m,m))
          left <- bTree leftHeight
          right <- bTree rightHeight
          return $ Node a left right
