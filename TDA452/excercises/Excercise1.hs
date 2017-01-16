pounds :: Double -> Double
pounds kr = kr/12.7775


price :: Double -> Double
price v
  | v <= 10 = 3.5*v
  | v > 10 = 5+3*v

--- Alt with case

price' :: Double -> Double
price' v
  | v < 11 = 3.5*v
  | otherwise = 5+3*v

-- Average
average :: Double -> Double -> Double
average x y = (x+y) / 2

-- Oprations can be written infix, example

example_infix :: Double -> Double -> Double
example_infix x y = x `average` y


daysInYear :: Int -> Int
daysInYear year
    | year `mod` 4 == 0 = 366
    | otherwise = 365


-- A bigger example
next :: Int -> Int
next x
  | x `mod` 2 == 0 = x `div` 2
  | otherwise = x*3+1

step :: Int -> Int
step x
  | x == 1 = 1
  | otherwise = 1 + step (next x)

numbers :: Int -> [Int]
numbers x
  | x == 1 = (1:[])
  | otherwise = (x:(numbers (next x)))
