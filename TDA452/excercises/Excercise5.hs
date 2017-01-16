-- Excercises 5
import Test.QuickCheck
import Data.List

--0) Expressions and integer trees
data Expr = Lit Int
          | Op Ops Expr Expr
data Ops = Add | Sub | Mul | Div | Mod

eval :: Expr -> Int
eval (Lit n)     = n
eval (Op Add e1 e2) = eval e1 + eval e2
eval (Op Sub e1 e2) = eval e1 - eval e2
eval (Op Mul e1 e2) = eval e1 * eval e2
eval (Op Div e1 e2) = eval e1 `div` eval e2
eval (Op Mod e1 e2) = eval e1 - (eval e2 *(eval e1 `div` eval e2))

showExpr :: Expr -> String
showExpr (Lit n)     = show n
showExpr (Op Add e1 e2) = "(" ++ showExpr e1 ++ "+" ++ showExpr e2 ++")"
showExpr (Op Sub e1 e2) = "(" ++ showExpr e1 ++ "-" ++ showExpr e2 ++")"
showExpr (Op Mul e1 e2) = "(" ++ showExpr e1 ++ "*" ++ showExpr e2 ++")"
showExpr (Op Div e1 e2) = "(" ++ showExpr e1 ++ "/" ++ showExpr e2 ++")"


--- B)
size :: Expr -> Int
size (Lit n) = 0
size (Op Add e1 e2) = 1 + size e1 + size e2
size (Op Sub e1 e2) = 1 + size e1 + size e2
size (Op Mul e1 e2) = 1 + size e1 + size e2
size (Op Div e1 e2) = 1 + size e1 + size e2

--- E)
data Expr' = Lit' Int
          | Expr' :+: Expr'
          | Expr' :-: Expr'
          | Expr' :*: Expr'
          | Expr' :/: Expr'
          | Expr' :%: Expr'

data NTree = NilT
           | Node Int NTree NTree
           deriving (Eq, Show)

sumTree :: NTree -> Int
sumTree NilT           = 0
sumTree (Node n t1 t2) = n + sumTree t1 + sumTree t2

depth :: NTree -> Int
depth NilT           = 0
depth (Node n t1 t2) = 1 + max (depth t1) (depth t2)

---- B)
returnSubs :: NTree -> (NTree,NTree)
returnSubs NilT   = (NilT,NilT)
returnSubs (Node n t1 t2) = (t1,t2)

--C)
isInTree :: NTree -> Int -> Bool
isInTree NilT _ = False
isInTree (Node n t1 t2) k
          | n == k = True
          | otherwise = isInTree t1 k || isInTree t2 k

-- D)
maxInTree :: NTree -> Int
maxInTree NilT = 0
maxInTree (Node n t1 t2) = max n (max (maxInTree t1) (maxInTree t2))

--E )
reflectTree ::  NTree -> NTree
reflectTree NilT = NilT
reflectTree (Node n t1 t2) = (Node n (reflectTree t1) (reflectTree t2))

-- Need to make instance of arb
prop_reflectTree :: NTree -> Bool
prop_reflectTree t = t == (reflectTree t)

--F)
collapse :: NTree -> [Int]
collapse NilT = []
collapse (Node n t1 t2) = (collapse t1) ++ [n] ++ (collapse t2)

sort' :: NTree -> [Int]
sort' NilT = []
sort' t = sort (collapse t)

prop_collapseSort :: NTree -> Bool
prop_collapseSort (Node n t1 t2) = (sort (collapse (t1) ++ (collapse t2) ++ [n])) == sort (collapse ((Node n t1 t2)))



-- 1 ) File systems
data File = Data String | Directory [File] String
          deriving (Show,Eq)

--- B)
findFile :: File -> File -> String
findFile file (Data fileName) |  file == (Data fileName) = (">"++(fileName))
                              | otherwise = "File not found"
findFile file (Directory [] dirName) = ("File not in Directory: "++dirName)
findFile (Data fileName) (Directory files dirName)  | (elem (Data fileName) files) = ("File " ++ fileName ++ " is in directory " ++ dirName)
-- How to recursively search?
