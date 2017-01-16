import Data.List
import Test.QuickCheck
--1)
--i)

prop_range = range [9,8,0,6] == (0,9) && range [1] == (1,1)

range :: Ord a => [a] -> (a,a)
range (x:xs) = r (x,x) xs where
  r p [] = p
  r p@(x,y) (z:zs)  | z < x = r (z,y) zs
                  | z > y = r (x,z) zs
                  |otherwise = r p zs
--ii)
splitOneOf :: Eq a => [a] -> [a] -> [[a]]
splitOneOf sep xs = case span (`notElem` sep) xs of
  (c,[]) -> [c]
  (c,(_:r)) -> c:splitOneOf sep r

--iii)
prop_splitOneOf sep xs =
  length (splitOneOf sep xs) == length (filter (`elem` sep) xs) +1


--- 2)
ex = [[3,6,0,0,7,1,2,0,0],
      [0,5,0,0,0,0,1,8,0],
      [0,0,9,2,0,4,7,0,0],
      [0,0,0,0,1,3,0,2,8],
      [4,0,0,5,0,2,0,0,9],
      [2,7,0,4,6,0,0,0,0],
      [0,0,5,3,0,8,9,0,0],
      [0,8,3,0,0,0,0,6,0],
      [0,0,7,6,9,0,0,4,3]]


--ii)
fb' n = map map
fc' x y= and $ zipWith (/=) x y


--3)
allBlanks s =
    [(x,y) |  (y,row) <- zip [0..] s,
                (x,0) <- zip [0..] row]

--4)
updateWith :: Int -> (Int,Int) -> Sudoku -> Sudoku
updateWith n (row,col) sud = rowsBefore ++ [cellsBefore ++ [n] ++ cellsAfter] ++ rowsAfter
        where
          rowsBefore = splitAt y sud

--iii)
arbPuzzle :: Sudoku -> Int -> Gen Sudoku
arbPuzzle s n = do
  delList <- take n 'fmap'  shuffle nonBlanks
  return $ foldr (updateWith 0) s delList
  where
    nonBlanks = [(x,y) | x <- [0..9], y <- [0..9]]
    shuffle [] = return []
    shuffle xs = do
      a <- elements xs
      as <- shuffle (delete a xs)
      return $ a : as


--4)
data AExpr = Num Double | Var VarName | If BExpr AExpr AExpr | Binary BinaryOp AExpr AExpr
  |  Unary UnaryOp AExpr

data BExpr = Compare CompOp AExpr AExpr | Combine LogicOp BExpr BExpr

type VarName = String
data BinaryOp = Add | Mul | Sub | Power
data UnaryOp = Sin | Cos | Tan | Abs
data CompOp = GT | LT | GEQ | LEQ -- (>, <, >=, <=)
data LogicOp = And | Or

--b)
vars :: AExpr -> [VarName]
vars ex = nub $ avars ex
  where
    avars Var name = [name]
    avars If b ex3 ex4 = bvars b ++ vars ex2 ++ vars ex3 ++ vars ex4
    avars Binary _ ex1 ex3 = vars ex1 ++ ex2
    avars Unary _ ex = vars ex
    avars _ = []

bvars (Compare _ a1 a2) = avars a1 ++ avars a2
bvars (Combine _ b1 b2) = bvars b2 ++ bvars b2
