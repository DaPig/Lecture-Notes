-- | Symbolic Expressons
-- Exercises with recursive data types and monads
-- Functional Programming course 2016.
-- Thomas Hallgren

{-
This is just a skeleton, the definitions will be filled in
during the lecture.
-}

module SymbolicExpressions where

-- | A Haskell data type for arithmetic expressions with variables
data Expr = Num Integer
          | Var Name           -- new
          | Add Expr Expr
          | Mul Expr Expr
          | Div Expr Expr      -- new
          deriving (Eq)

type Name = String

ex1 = Num 2
ex2 = Add (Num 2) (Num 2)
ex3 = Mul (Add (Num 1) (Num 2)) (Num 3)
ex4 = Add (Num 1) (Mul (Num 2) (Num 3))
ex5 = Div x (Mul (Num 2) y)

x   = Var "x"
y   = Var "y"

--------------------------------------------------------------------------------

instance Show Expr where
  show = showExpr

showExpr :: Expr -> String
showExpr (Add e1 e2) = showExpr e1 ++ "+" ++ showExpr e2
showExpr e           = showFactor e

showFactor :: Expr -> String
showFactor (Mul e1 e2) = showFactor e1 ++ "*" ++ showFactor e2
showFactor (Div e1 e2) = showFactor e1 ++ "/" ++ showDivisor e2
showFactor e           = showDivisor e

showDivisor :: Expr -> String
showDivisor (Num n) = show n
showDivisor (Var x) = x
showDivisor e       = "("++showExpr e++")"


--------------------------------------------------------------------------------

-- | Gathering variables
{-
vars :: Expr -> [Name]
vars (Num n) = 
vars (Var x) = 
vars (Add a b) =
vars (Mul a b) =
vars (Div a b) =
-}

--------------------------------------------------------------------------------

-- | Evaluating Symbolic Expressions
{-
eval :: [(Name,Integer)] -> Expr -> Integer
eval env (Num n) = n
--eval env (Var x) = 
eval env (Add a b) = eval env a + eval env b
eval env (Mul a b) = eval env a * eval env b
-}

--------------------------------------------------------------------------------

-- | Symbolic Differentiation
{-
diff :: Expr -> Name -> Expr
diff (Num n)   x =
diff (Var y)   x =
diff (Add a b) x =
diff (Mul a b) x =
-}

-- * Smart constructors


--------------------------------------------------------------------------------
-- | Applicative Expression Evaluator

evalA :: Expr -> Integer
evalA (Num n)     = n
evalA (Add e1 e2) = evalA e1 + evalA e2
evalA (Mul e1 e2) = evalA e1 * evalA e2


--------------------------------------------------------------------------------
-- * Avoiding division by zero
{-
evalD (Num n) =
evalD (Add a b) =
evalD (Mul a b) =
evalD (Div a b) =

--safeDiv1 
--}

--------------------------------------------------------------------------------
-- * Making the environment implicit
{-
evalE (Num n)   = 
evalE (Var x)   = 
evalE (Add a b) = 
evalE (Mul a b) = 
--}

--------------------------------------------------------------------------------
-- * A monad for eval

-- | A monad for environments and avoiding failures
{-
data Eval a =
--runE

instance Functor Eval where
  fmap = liftM

instance Applicative Eval where
  pure = return
  (<*>) = ap

instance Monad Eval where
  return x =
  E m >>= f =
--}
--divByZero = 
--lookupVar x = 

--safeDiv 
{-
evalM (Num n) = 
evalM (Var x) = 
evalM (Add a b) = 
evalM (Mul a b) = 
evalM (Div a b) = 
--}
