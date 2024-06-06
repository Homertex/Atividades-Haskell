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