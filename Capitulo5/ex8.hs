data Arvore a = Nulo | Folha a | Raiz a (Arvore a) (Arvore a) deriving (Show)

mapa :: (Int -> Int) -> Arvore Int -> [Int]
mapa f (Raiz c l r) = mapa f l ++ [f c] ++ mapa f r
mapa f (Folha c) = [f c]
mapa f Nulo = []

mapa2 :: (Int -> Int) -> Arvore Int -> Arvore Int
mapa2 f (Raiz c l r) = Raiz (f c) (mapa2 f l) (mapa2 f r)
mapa2 f (Folha c) = Folha (f c)
mapa2 f Nulo = Nulo

somaCinco :: Int -> Int
somaCinco x = x + 5