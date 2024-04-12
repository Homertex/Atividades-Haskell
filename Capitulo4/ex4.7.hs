data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Show, Eq)

filtrandoTerca :: [Dia] -> [Dia]
filtrandoTerca = filter (== Terca)


