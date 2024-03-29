eliminaVogal :: String -> String
eliminaVogal palavra = [ x | x <- palavra, x `notElem` "aeiouAEIOU" ]