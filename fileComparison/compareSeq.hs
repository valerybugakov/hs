{-
  Compare two files line by line.
  Two threads read files line by line.
  After that the 3rd one can compare received strings.
-}

import Text.Read
import System.Environment
import Data.List
import Control.Parallel.Strategies
import System.Exit

-- main :: IO ()
main = do
    [f1,f2] <- getArgs
    putStrLn f1
    putStrLn f2
    f1' <- readFile f1
    f2' <- readFile f2
    -- putStrLn "---------------"
    -- mapM_ myCheck (lines f1')
    -- mapM putStrLn $ zipWith "asd" "adf"
    -- mapM putStrLn $ zipWith myCheck "asd" "asf"
    -- [ (i,j) | i <- (lines f1'), j <- (lines f2')]
    -- mapM print $ zipWith (\a b -> a == b) (lines f1') (lines f2')
    mapM bar $ zipWith compareLines (lines f1') (lines f2')
    putStrLn "\n\n Success \n\n"

    -- putStr f1'
    -- putStrLn "---------------"
    -- putStr f2'
    -- mapM_ putStrLn (lines file)
    -- print x
    -- print y
    -- mapM putStrLn f

-- foo :: String -> String -> IO Bool
-- foo a b = a == b
bar a = a
compareLines s1 s2 =
    case s1 == s2 of
      True -> return()
      False -> putStrLn "\n\n Failure, files are not identical \n\n" >> exitFailure

-- myCheck :: String -> Bool
-- myCheck str str2 = do
    -- print str == str2
    -- read str
    -- [str, str2]

    -- [ (i,j) | i <- [1..5], j <- [1..5]]

    -- case reads str :: [(Integer, String)] of
    --   [(_, "")] -> print True
    --   _         -> print False

    -- print str
    -- case (readMaybe str :: Maybe Int) of
    --   _ -> False

-- some :: (String a -> String a -> Bool) -> String a -> String a ->
