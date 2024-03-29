lengthOfEachString :: [String] -> [Int]
lengthOfEachString = map length . filter (odd . length)