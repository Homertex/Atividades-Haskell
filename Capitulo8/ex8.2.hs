mult234 :: Double -> Caixa Double -> Caixa Double
mult234 x (Um a) = Um (2 * a * x)
mult234 x (Dois a b) = Dois (2 * a * x) (3 * b * x)
mult234 x (Tres a b c) = Tres (2 * a * x) (3 * b * x) (4 * c * x)