module PrimeiroESegundo where

import Control.Applicative

data Coisa a = UmaCoisa a | DuasCoisas a a | ZeroCoisa deriving (Show)

instance Functor Coisa where
    fmap g ZeroCoisa = ZeroCoisa
    fmap g (UmaCoisa x) = UmaCoisa (g x)
    fmap g (DuasCoisas x y) = DuasCoisas (g x) (g y)

instance Applicative Coisa where
    pure = UmaCoisa
    (UmaCoisa f) <*> (UmaCoisa x) = UmaCoisa (f x)
    (UmaCoisa f) <*> (DuasCoisas x y) = DuasCoisas (f x) (f y)
    (DuasCoisas f g) <*> (DuasCoisas x y) = DuasCoisas (f x) (g y)
    _ <*> _ = ZeroCoisa

mult234 :: Double -> Coisa Double -> Coisa Double
mult234 n (UmaCoisa x) = UmaCoisa (2 * x * n)
mult234 n (DuasCoisas x y) = DuasCoisas (3 * x * n) (4 * y * n)
mult234 _ ZeroCoisa = ZeroCoisa
