module SimpleIO where
import Data.List
import System.IO

sayHello = do
  putStrLn "What's your name?"
  name <- getLine
  putStrLn $ "Hello " ++ name

writeToFile = do
  fileHandle <- openFile "./data/test.txt" WriteMode
  hPutStrLn fileHandle "Random text"
  hClose fileHandle

readFromFile = do
  fileHandle <- openFile "./data/test.txt" ReadMode
  contents <- hGetContents fileHandle
  putStrLn contents
  hClose fileHandle
