module CaixaEx where

data Caixa a = Um a | Dois a a | Tres a a a deriving (Show)

instance Functor Caixa where
    fmap f (Um x) = Um (f x)
    fmap f (Dois x y) = Dois (f x) (f y)
    fmap f (Tres x y z) = Tres (f x) (f y) (f z)

instance Applicative Caixa where
    pure = Um
    (Um f) <*> (Um x) = Um (f x)
    (Um f) <*> (Dois x y) = Dois (f x) (f y)
    (Um f) <*> (Tres x y z) = Tres (f x) (f y) (f z)
    (Dois f g) <*> (Dois x y) = Dois (f x) (g y)
    (Tres f g h) <*> (Tres x y z) = Tres (f x) (g y) (h z)
    _ <*> _ = error "Incompatible structures"

instance Monad Caixa where
    return = pure
    (Um x) >>= f = f x
    (Dois x y) >>= f = case (f x, f y) of
                         (Um a, Um b) -> Dois a b
                         _ -> error "Invalid Monad structure"
    (Tres x y z) >>= f = case (f x, f y, f z) of
                          (Um a, Um b, Um c) -> Tres a b c
                          _ -> error "Invalid Monad structure"

mult234 :: Double -> Caixa Double -> Caixa Double
mult234 x (Um a) = Um (2 * a * x)
mult234 x (Dois a b) = Dois (2 * a * x) (3 * b * x)
mult234 x (Tres a b c) = Tres (2 * a * x) (3 * b * x) (4 * c * x)

example :: Caixa Double
example = do
    x <- Um 5
    y <- Dois 2 3
    z <- Tres 1 2 3
    return (x + y + z)
