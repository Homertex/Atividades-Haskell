
exercicioA :: [Int]
exercicioA = [11 ^ n | n <- [0..6]]

exercicioB :: [Int]
exercicioB = [x | x <- [1..39], x `mod` 4 /= 0 && x `mod` 8 /= 0]

exercicioC :: [String]
exercicioC = ["A" ++ [c] ++ "BB" | c <- ['a'..'g']]

exercicioD :: [Int]
exercicioD = [x | x <- [5,8..41], x `mod` 3 /= 0]

exercicioE :: [Float]
exercicioE = [2 ** (-n) | n <- [0..5]]

exercicioF :: [Int]
exercicioF = [1 + 9 * x | x <- [0..7]]

exercicioG :: [Int]
exercicioG = [x | x <- [2,4..30], x `mod` 6 /= 0]

exercicioH :: [Char]
exercicioH = filter (`notElem` "BDFHIK") ['@', 'A'..'L']