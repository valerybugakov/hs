i ntegration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = d * sum [ f (a + d * k) | k <- [0..n] ] - d / 2 * (f a + f b)
    where
      d = (b - a) / n
      n = 1000
