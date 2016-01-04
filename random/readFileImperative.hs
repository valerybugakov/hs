import System.IO
import Data.Char

main :: IO()
main = do
    inh <- openFile "./data/f1.txt" ReadMode
    outh <- openFile "./data/output" WriteMode
    mainLoop inh outh
    hClose inh
    hClose outh

mainLoop inh outh = do
    isEnd <- hIsEOF inh
    if isEnd
      then return()
      else do inpString <- hGetLine inh
              hPutStrLn outh (map toUpper inpString)
              putStrLn(show inpString)
              mainLoop inh outh
