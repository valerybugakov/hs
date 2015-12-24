import Data.Set hiding (map)
import Data.Maybe
import Data.Char
import Data.Text.Internal.Lazy
import Text.Printf
import System.IO
import System.Environment
import Control.Concurrent
import Control.Monad

main = do
      (f, g, n) <- readFiles
      let dict = fromList (lines f)
          work = chunk n (words g)
      run n dict work

run n dict work = do
        chan <- newChan
        errs <- getChanContents chan    -- errors returned back to main thread
        mapM_ (forkIO . thread chan dict) (zip [1..n] work)
        wait n errs 0

wait n xs i = when (i < n) $ case xs of
        Nothing : ys -> wait n ys $! i+1
        Just s  : ys -> putStrLn s >> wait n ys i

thread chan dict (me, xs) = do
        mapM_ spellit xs
        writeChan chan Nothing

     where
        spellit w = when (spell dict w) $
            writeChan chan . Just $ printf "Thread %d: %-25s" (me::Int) w

spell = flip notMember

readFiles = do
        [s,n] <- getArgs
        f     <- readFile "./data/first"
        g     <- readFile s
        return (f,g, read n)
