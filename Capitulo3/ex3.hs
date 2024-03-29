data Tipo = Pedra | Papel | Tesoura

jogo :: Tipo -> Tipo -> String

jogo Pedra Papel = "Papel Vence."
jogo Papel Pedra = "Papel Vence."
jogo Pedra Tesoura  = "Pedra Vence."
jogo Tesoura Pedra = "Pedra Vence."
jogo Tesoura Papel = "Tesoura Vence."
jogo Papel Tesoura = "Tesoura Vence."
jogo _ _ = "Empate."