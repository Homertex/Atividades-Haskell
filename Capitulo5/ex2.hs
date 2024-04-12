import Data.Monoid

data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving (Show)

data Produto = Produto { valor :: Double, tp    :: TipoProduto } | Nada deriving (Show)

instance Semigroup Produto where
    (Produto v1 t1) <> (Produto v2 t2) = Produto (v1 + v2) Total
    (Produto v1 t1) <> Nada = Produto v1 Total
    Nada <> (Produto v2 t2)  = Produto v2 Total
    Nada <> Nada = mempty

instance Monoid Produto where
    mempty = Nada

totalGeral :: [Produto] -> Double
totalGeral p = valor (mconcat p) 