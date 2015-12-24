import System.IO
import System.Environment
import Data.Char
import System.Exit

main :: IO()
main = do
    [f1, f2] <- getArgs
    f1h <- openFile f1 ReadMode
    f2h <- openFile f2 ReadMode
    mainLoop f1h f2h
    hClose f1h
    hClose f2h

mainLoop f1 f2 = do
    isEnd <- hIsEOF f1
    if isEnd
      then putStrLn "\n\n Success, congrats Bro! \n\n" >> return()
      else do s1 <- hGetLine f1
              s2 <- hGetLine f2
              -- print $ s1 ++ " - " ++ s2
              compareLines s1 s2
              mainLoop f1 f2

compareLines s1 s2 =
    case s1 == s2 of
      True -> return()
      False -> putStrLn "\n\n Failure, files are not identical \n\n" >> exitFailure
