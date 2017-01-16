import Test.QuickCheck
-- 1
--a)
sales :: Int -> Int -- dummy function
sales n = n `mod` 2 - 1


zeroWeeks1 :: Int -> Int
zeroWeeks1 n = length [() | i<- [0..n], sales i == 0 ]

zeroWeeks2 :: Int -> Int
zeroWeeks2 n = (length . filter (==0) . map sales)  [0..n]

zeroWeeks3 :: Int -> Int
zeroWeeks3 n = (length . calcZero ) [0..n]
  where
    calcZero :: [Int] -> [Int]
    calcZero [] = []
    calcZero (x:xs) | sales x == 0 = (x:(calcZero xs))
                    | otherwise = calcZero xs
zeroWeeks4 :: Int -> Int
zeroWeeks4 n = foldr (\x acc -> if (sales x)==0 then acc+1 else acc) 0 [0..n]


-- b
maxWeeks :: Int -> [Int]
maxWeeks n = filter ((==m) . sales) weeks
  where
    weeks = [0..n]
    m = maximum (map sales weeks)

--2
--a )
data Ticket = Train City City TrainClass | Bus City City  | Flight City City FlightClass
type City = String
data TrainClass = FirstClass | SecondClass
data FlightClass = BuisnessClass | SuperEcon | Econ


--b) ?


--3)
data Logic = Const Bool | And Logic Logic | Not Logic | Var String
type Env = [(String,Bool)]

--a)
eval :: Env -> Logic -> Maybe Bool
eval e (Const b) = Just b
eval e (And x y) = case eval x of
  Just True -> eval y
  Just False -> Just False
  Nothing -> Nothing
eval e (Not x) = case eval x of
  Just b -> Just (Not b)
  Nothing -> Nothing
eval e (Var x) = lookup e x

--b)
eval' e (Const b) = Just b
eval' e (And x y) = do
  x <- eval' e x
  if b then eval' e y else return False
eval' e (Not x) = do
  b <- eval' e x
  return (not b)
eval' e (Var x) = lookup e x

--c)
vars :: Logic -> [String]
vars (And x y) = vars x ++ vars y
vars (Not x) = [not (eval x)]
vars (Var x) = [x]
vars _ = []

allEnvs :: [String] -> [Env]
allEnvs (x:xs) = let es = allEnvs xs in
  map((x,True):) es ++ map((x,False):) es

taut :: Logic -> Bool
taut l = and [b | Just b<- map(flip eval l) es]
  where es = allEnvs (vars l)

--4 )
perm :: [a] -> Gen[a]
perm [] = []
perm xs = do
  a <- elements xs
  return (a:(delete a xs))

-- 5)
data Rose a = R a [Rose a]

example = R 1 [left, middle, right]
  where
    left = R 2 [leaf 4, leaf 5, leaf 6]
    middle = leaf 0
    right = R 3 [leaf 7]

--b)
roseMap :: (a -> b) -> Rose a -> Rose b
roseMap f (R a xs) = R (f a) (map roseMap xs)

--c)
level :: Int -> Rose a -> [a]
level 0 _ = []
level 1 R a _ = [a]
level n R _ xs = map level (n-1) xs

--d)
type Dir = D DirName [File]


--e)
