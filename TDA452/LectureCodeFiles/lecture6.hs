import Prelude
import Data.Char(isSpace)
import Data.List(sort,group)


countWords :: String -> String
countWords = unlines .
             map (\(n,w)->w++": "++show n) .
             reverse .
             sort .
             map (\ws->(length ws,head ws)) .
             group .
             sort .
             words

showTheDifference :: IO ()
showTheDifference = do putStrLn "Enter two numbers:"
                  x <- readLn
                  y <- readLn
          putSt:r "The difference is: "
          print (x-y)

copyFile :: FilePath -> FilePath -> IO ()
copyFile from to = do s <- readFile from
                      writeFile to s
---------------------------------------
sortFile :: FilePath -> FilePath -> IO ()
sortFile from to = do s <- readFile from
                      writeFile to (sortLines s)

sortLines = unlines . sort . lines
-----------------------------------------
doTwice :: IO a -> IO (a,a)
doTwice io = do x <- io
                y <- io
                return (x,y)

don't :: IO a -> IO ()
don't io = return ()
