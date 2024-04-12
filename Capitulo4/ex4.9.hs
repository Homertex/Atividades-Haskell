data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Show, Eq)


contarNegativos :: [Int] -> Int
contarNegativos = foldl (\acc x -> if x < 0 then acc + 1 else acc) 0


contarLetrasP :: String -> Int
contarLetrasP = foldl (\acc c -> if c == 'P' then acc + 1 else acc) 0


contarSabados :: [Dia] -> Int
contarSabados = foldl (\acc d -> if d == Sabado then acc + 1 else acc) 0


converterDiaParaInt :: Dia -> Int
converterDiaParaInt Domingo = 1
converterDiaParaInt Segunda = 2
converterDiaParaInt Terca = 3
converterDiaParaInt Quarta = 4
converterDiaParaInt Quinta = 5
converterDiaParaInt Sexta = 6
converterDiaParaInt Sabado = 7


somaDias :: [Dia] -> Int
somaDias = foldl (\acc d -> acc + converterDiaParaInt d) 0
