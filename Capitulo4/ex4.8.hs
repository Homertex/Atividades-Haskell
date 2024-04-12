data Moeda = Real | Dolar deriving (Show, Eq)

data Dinheiro = Dinheiro { valor :: Double, moeda :: Moeda } deriving (Show, Eq)


paraDolar :: [Dinheiro] -> [Dinheiro]
paraDolar = map (\d -> if moeda d == Real then Dinheiro { valor = valor d * 5, moeda = Dolar } else d)


filtraDolares :: [Dinheiro] -> [Dinheiro]
filtraDolares = filter (\d -> moeda d == Dolar)


somaDolares :: [Dinheiro] -> Double
somaDolares = sum . map valor . filtraDolares


contarDolares :: [Dinheiro] -> Int
contarDolares = length . filtraDolares


