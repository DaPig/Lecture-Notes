import Test.QuickCheck

placeInWord :: String -> [Char] -> [(Int,Char)]
placeInWord str chars = [(i,c) | (i,c) <- zip [0..] str, c `elem` chars ]

-- More lisrt comprehentions
type Matrix = [[Integer]]

matrix = [[1,2,3,4,5,0,7],
          [1,2,3,4,0,6,7],
          [1,2,0,4,5,6,7],
          [1,2,3,4,5,6,7],
          [1,2,3,4,5,0,7]]


-- Find positions which have value zero at specific placements
findValues :: Matrix -> Integer -> [(Integer,Integer)]
findValues m val = [(x,y) | (x,rows) <- zip [0..] m,
                    (y,0) <- zip [0..] rows]

starTree :: Int -> IO()
starTree n = putStrLn (tree n)

tree :: Int -> String
tree n = unlines [(ch (n-m) " " ) ++ (ch m " *")|m<- [1..n] ]
  where
    ch n = concat . replicate n

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving Show

hBalanced :: Tree a -> (Int,Bool)
hBalanced Leaf = (0,True)
hBalanced (Node _ l r) =
  let
    (h1,bL) = hBalanced l
    (h2,bR) = hBalanced r
    in ((1+ max h1 h2),(abs (h1-h2)) <2 && bL && bR)

range :: Ord a => [a] -> (a,a)
range n = minMax n
  where
    minMax :: Ord a => [a] -> (a,a)
    minMax (x:[]) = (x,x)
    minMax (x:xs) = let
      (y,z) = minMax xs
      in ((min x y),(max z x))

range' :: Ord a => [a] -> (a,a)
range' (n:ns) = r (n,n) ns where
  r (s,b) [] = (s,b)
  r (s,b) (m:ms) = r (s `min` m, b `max` m) ms


splitOneOf :: Eq a => [a] -> [a] -> [[a]]
splitOneOf xs sep =  case span (`notElem` sep) xs of
  (c,[]) -> [c]
  (c,_:cs) -> c:(splitOneOf cs sep)

prop_splitOneOf0 :: Eq a => [a] -> Bool
prop_splitOneOf0 as =
 splitOneOf ";:" "A;BB:;DDDD:" == ["A","BB","","DDDD",""]
  && splitOneOf [2,3,4] [3,0,1,2,0,0] == [[],[0,1],[0,0]]
  && splitOneOf as [] == [[]]
  && splitOneOf [] as == [as]

findZeroes :: [[[Int]]] -> [(Int,Int,Int)]
findZeroes n =
  [(x,y,z) | (y,row) <- zip [0..] n,
  (x,col) <- zip [0..] row,
  (z,0) <- zip [0..] col]

duplicates :: Eq a => [a] -> Bool
duplicates [] = False
duplicates (x:xs) = case (x `elem` xs) of
  True -> True
  False -> duplicates xs

positions :: [Char] -> Char -> [(Integer, Char)]
positions list c = [(position,val) | (position,val) <- zip [0..] list, c == val]



testInt :: Int -> Maybe Int
testInt n = case (n<4) of
  (True) -> Nothing
  False -> Just n


data Test = Empty | Single Data | Dual Data Data
 deriving(Show,Eq)
type Data = Integer

instance Arbitrary Test where
  arbitrary = gTest


gTest :: Gen Test
gTest = do
  gen <- frequency[(2,rSingle), (5,rDual),(3,rEmpty)]
  return gen

rSingle :: Gen Test
rSingle = do
  x <- arbitrary
  return $ Single x

rDual :: Gen Test
rDual = do
  x <- arbitrary
  y <- arbitrary
  return $ Dual x y

rEmpty :: Gen Test
rEmpty = do
  return Empty


addData :: Test -> Integer -> Test
addData Empty n = Empty
addData (Single d1) n = Single (d1+n)
addData (Dual d1 d2) n = (Dual (d1+n) (d2+n))


prop_TestAddData :: Test -> Integer -> Bool
prop_TestAddData d@Empty n = addData d n == Empty
prop_TestAddData d@(Single d1) n = addData d n == (Single (d1+n))
prop_TestAddData d@(Dual d1 d2) n = addData d n == (Dual (d1+n) (d2+n))


testMon :: Int -> Maybe Int
testMon n = case n<8 of
  True -> Just n
  False -> Nothing
