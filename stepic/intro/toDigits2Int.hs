import Data.Char
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y
  | isDigit x && isDigit y = digitToInt x * 10 + digitToInt y
  | otherwise = 100
