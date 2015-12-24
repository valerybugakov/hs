import System.Random
import System.IO.Unsafe
import System.IO
import System.Environment

main :: IO()
main = do
    -- writeFile "./data/gen1.txt" (unlines $ map (\a -> (randomStr 10000)) [1..10000])
    [fname, linesNumber, lineLength] <- getArgs
    f <- openFile fname WriteMode
    writeLines f (read linesNumber :: Int) (read lineLength :: Int)
    hClose f

writeLines :: Handle -> Int -> Int -> IO ()
writeLines _ 0 _ = print "done"
writeLines f n l = hPutStrLn f (randomStr l) >> writeLines f (n - 1) l

randomStr :: Int -> String
randomStr n = take n $ randomRs ('a','z') $ unsafePerformIO newStdGen
