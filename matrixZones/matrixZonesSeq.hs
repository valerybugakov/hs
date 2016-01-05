{-
  Find number of zones in random matrix.
  I.E ( 1 1 1 0 0 0 )
      ( 1 1 2 2 0 1 )
      ( 0 0 0 1 1 1 )
  If two `1` are next to each other (horizontally or vertically only)
  they belong to the same zone. Therefore number of zones in example
  matrix equals to 5.

  to install matrix lib: cabal install matrix
-}

import Data.Matrix
import Data.Maybe
import Data.Vector
import System.IO.Unsafe

-- rnd bnds = randomRIO bnds
rnd bnds = unsafePerformIO (getStdRandom (randomR bnds))
-- g <- rnd (1,100)

main = do
    rowN = 4
    colN = 4
    m = matrix rowN colN $ \(i, j) -> 2
    z = zero rowN colN
    -- setElem 1 (1,1) zero
    checkRow m z 0 rowN
    -- markElems m z 0 1 1

checkRow m z zoneN i =
      -- mapRow checkEl i
      let row = getRow i m
      let updatedZoneN = Data.Vector.foldl checkEl zoneN row
      checkRow m z updatedZoneN (i - 1)
      -- checkRow m z list zoneN (i - 1)
    where
      checkEl j x
        | bottomEl == currentEl && leftEl == currentEl =
        | leftEl == currentEl && currentMark == Just 0 =
            setElem zoneN (i,j) z
        where
          currentEl = safeGet i j m
          currentMark = safeGet i j z
          leftEl = safeGet (i - 1) j m
          bottomEl = safeGet i (j + 1) m
          -- topEl = safeGet i (j - 1) m


markElems m z c i j =
    value = safeGet i j m
    mark = safeGet i j z
    if mark == 0
      then markNewZone c + 1
      else

markNewZone newC =
    setElem newC (i,j) z

    markElementInZone (i + 1) j m
    markElementInZone (i - 1) j m
    markElementInZone i (j + 1) m
    markElementInZone i (j - 1) m

markElementInZone value i j m
      | value == nextValue = markElems 
      | isJust nextValue = markNewZone c + 1
      | otherwise = return()
    where nextValue = safeGet i j m

-- getElemSafe i j m
--     | i < 1 || j < 1 || i > (nrows m) || j > (ncols m) = (- 1)
--     | otherwise = getElem i j m




