import System.Random
import System.IO.Unsafe
import System.IO

randomStr :: Int -> String
randomStr n = take n $ randomRs ('a','z') $ unsafePerformIO newStdGen

main = do
    writeFile "./data/gen1.txt" (unlines $ map (\a -> (randomStr 10000)) [1..10000])
    print "done"

