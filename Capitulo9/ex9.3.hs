import System.Random (randomRIO)

data Opcao = Pedra | Papel | Tesoura deriving (Show, Enum, Bounded)

instance Random Opcao where
  randomR (a, b) g = 
    let (r, g') = randomR (fromEnum a, fromEnum b) g
    in (toEnum r, g')
  random = randomR (minBound, maxBound)

ganhador :: Opcao -> Opcao -> String
ganhador Pedra Tesoura = "Você ganhou!"
ganhador Tesoura Papel = "Você ganhou!"
ganhador Papel Pedra = "Você ganhou!"
ganhador o1 o2
  | o1 == o2  = "Empate!"
  | otherwise = "Você perdeu!"

main :: IO ()
main = do
  putStrLn "Escolha uma opção: Pedra, Papel ou Tesoura"
  opcaoStr <- getLine
  let opcao = case opcaoStr of
                "Pedra"  -> Just Pedra
                "Papel"  -> Just Papel
                "Tesoura" -> Just Tesoura
                _        -> Nothing
  case opcao of
    Just o -> do
      computador <- randomRIO (minBound :: Opcao, maxBound :: Opcao)
      putStrLn $ "Computador escolheu: " ++ show(computador)
      putStrLn $ ganhador o computador
    Nothing -> putStrLn "Opção inválida! Tente novamente."
