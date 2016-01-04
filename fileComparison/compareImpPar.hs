import System.IO
import System.Environment
import Data.Char
import Control.Parallel.Strategies
import Control.DeepSeq
import System.Exit
import Control.Monad.Random
import Data.Char

main :: IO()
main = do
    [f1,f2] <- getArgs
    f1h <- openFile f1 ReadMode
    f2h <- openFile f2 ReadMode
    mainLoop f1h f2h
    hClose f1h
    hClose f2h

mainLoop f1 f2 = do
    isEnd <- hIsEOF f1
    if isEnd
      then putStrLn "\n\n Success, congrats Bro! \n\n" >> return()
      else do let ss = runEval $ do
                         s1 <- rpar (hGetLine f1 >>= return)
                         s2 <- rpar (hGetLine f2 >>= return)
                         rseq s1
                         rseq s2
                         return (s1, s2)

              x <- fst ss
              y <- snd ss
              -- print $ x ++ " - " ++ y
              runEval $ rpar (compareLines x y)
              mainLoop f1 f2


compareLines s1 s2 =
    case s1 == s2 of
      True -> return()
      False -> putStrLn "\n\n Failure, files are not identical \n\n" >> exitFailure
