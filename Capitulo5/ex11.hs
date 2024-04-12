data Arvore a = Nulo | Folha a | Raiz a (Arvore a) (Arvore a) deriving (Show)

tamanhoArvore :: Arvore Int -> Int
tamanhoArvore (Raiz c l r) = tamanhoArvore l + 1 + tamanhoArvore r
tamanhoArvore (Folha x) = 1
tamanhoArvore Nulo = 0

somaElementos :: Arvore Int -> Int
somaElementos (Raiz c l r) = somaElementos l + c + somaElementos r
somaElementos (Folha x) = x
somaElementos Nulo = 0

posOrdem :: Show a => Arvore a -> [a]
posOrdem (Raiz c l r) = posOrdem l ++ posOrdem r ++ [c] 
posOrdem (Folha x) = [x]
posOrdem Nulo = []

-- teste de mesa para arvore: Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo))

-- posOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) =  posOrdem (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo) ++ posOrdem (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) ++ [15]

-- posOrdem Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo) = posOrdem (Folha 6) ++ posOrdem (Raiz 12 (Folha 10) Nulo) ++ [11]

-- posOrdem Folha 6 = [6]

-- posOrdem Raiz 12 (Folha 10) Nulo = posOrdem (Folha 10) ++ posOrdem Nulo ++ [12]

-- posOrdem Folha 10 = [10]

-- posOrdem Nulo = []

-- posOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [6,10,12,11] ++ posOrdem (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) ++ [15]

-- posOrdem Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo) = posOrdem Nulo ++ posOrdem Raiz 22 (Folha 21) Nulo ++ [20]

-- posOrdem Nulo = []

-- posOrdem Raiz 22 (Folha 21) Nulo = posOrdem (Folha 21) ++ posOrdem Nulo ++ [22]

-- posOrdem Folha 21 = [21]

-- posOrdem Nulo = []

-- posOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [6,10,12,11] ++ [21,22,20] ++ [15]

-- [6,10,12,21,22,20,15]

preOrdem :: Show a => Arvore a -> [a]
preOrdem (Raiz c l r) = [c] ++ preOrdem l ++ preOrdem r 
preOrdem (Folha x) = [x]
preOrdem Nulo = []

-- teste de mesa para arvore: Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo))

-- preOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [15] ++ preOrdem (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) ++ preOrdem (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo))

-- preOrdem (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) = [11] ++ preOrdem (Folha 6) ++ preOrdem (Raiz 12 (Folha 10) Nulo))

-- preOrdem Folha 6 = 6

-- preOrdem (Raiz 12 (Folha 10) Nulo)) = [12] ++ preOrdem (Folha 10) ++ preOrdem Nulo

-- preOrdem Folha 10 = 10

-- preOrdem Nulo = []

-- preOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [15] ++ [11, 6, 12, 10] ++ preOrdem (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo))

-- preOrdem (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [20] ++ preOrdem Nulo ++ preOrdem (Raiz 22 (Folha 21) Nulo)

-- preOrdem (Raiz 22 (Folha 21) Nulo) = [22] ++ preOrdem (Folha 21) ++ preOrdem Nulo

-- preOrdem Folha 21 = 21

-- preOrdem Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo)) = [15] ++ [11, 6, 12, 10] ++ [20,22,21]

-- [15, 11, 6, 12, 10, 20, 22, 21]