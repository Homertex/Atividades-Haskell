example :: Caixa Double
example = do
    x <- Um 5
    y <- Dois 2 3
    z <- Tres 1 2 3
    return (x + y + z)