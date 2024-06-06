Tres 1 2 3 >>= \x -> return (2 * x) >>= mult234

--MANUAL DE USO
-- Tres 1 2 3 >>= (\x -> return (2 * x)) >>= mult234
-- Tres 1 2 3 >>= \x -> Um (2 * x) >>= mult234
-- Tres 1 2 3 >>= \x -> mult234 (2 * x) (Um (2 * x))
-- Tres 1 2 3 >>= \x -> mult234 (2 * x) (Um (2 * x))
-- Tres (mult234 2 1) (mult234 4 2) (mult234 6 3)
-- Tres (Um (2 * 2 * 1)) (Um (2 * 2 * 1)) (Um (3 * 2 * 1)) -> Erro

Dois 2 4 >>= mult234

-- Dois 2 4 >>= mult234
-- mult234 2 (Um 2) >>= mult234
-- mult234 4 (Um 4) >>= mult234
-- Dois (mult234 2 4) (mult234 4 2)
-- Dois (Um (2 * 4)) (Um (2 * 2))
-- Dois 8 4

Dois 2 3 >>= \_ -> Dois 7 7

-- Dois 2 3 >>= \_ -> Dois 7 7
-- Dois 7 7