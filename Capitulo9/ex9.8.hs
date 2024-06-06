import System.IO

-- Função para encontrar o maior elemento de uma lista
maxInList :: [Int] -> Int
maxInList = foldl1 max

-- Função principal
main :: IO ()
main = do
    -- Ler o conteúdo do arquivo de entrada
    contents <- readFile "entrada.txt"
    let linhas = lines contents
        -- Converter cada linha em uma lista de inteiros
        numeros = map (map read . words) linhas :: [[Int]]
        -- Encontrar o maior número de cada linha
        maioresPorLinha = map maxInList numeros
        -- Encontrar o maior número entre todos
        maiorNumero = maximum maioresPorLinha
    
    -- Escrever os resultados no arquivo de saída
    writeFile "saida.txt" $ unlines (map show maioresPorLinha)
    appendFile "saida.txt" $ "Maior número: " ++ show maiorNumero
