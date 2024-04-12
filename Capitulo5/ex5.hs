data Paridade = Par | Impar deriving Show

class ParImpar a where
    decide :: a -> Paridade

instance ParImpar Int where
    decide x = if even x then Par else Impar

instance ParImpar [a] where
    decide x = if even $ length x then Par else Impar

instance ParImpar Bool where
    decide x = if x then Impar else Par