oiPrimo :: Int -> Bool
oiPrimo n
  | n <= 1 = False
  | otherwise = null [x | x <- [2..floor (sqrt (fromIntegral n))], n `mod` x == 0]

filtrandoOsPrimo :: [Int] -> [Int]
filtrandoOsPrimo = filter oiPrimo


