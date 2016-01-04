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

main do =
    m = matrix 4 4 $ \(i, j) -> 2
    z = zero 4 4


