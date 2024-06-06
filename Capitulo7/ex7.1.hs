module PrimeiroESegundo where

import           Control.Applicative

data Coisa a
  = UmaCoisa a
  | DuasCoisas a a
  | ZeroCoisa
  deriving (Show)

instance Functor Coisa where
  fmap g ZeroCoisa        = ZeroCoisa
  fmap g (UmaCoisa x)     = UmaCoisa (g x)
  fmap g (DuasCoisas x y) = DuasCoisas (g x) (g y)
