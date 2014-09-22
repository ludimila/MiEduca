
-- Return: The size of the string
sizeList :: String->Int
sizeList oneWord = length oneWord

-- Return: print dash on the screen
fill :: Int -> [String]
fill dash = ["-" | dash <- [1..dash]]

impressDash :: String -> [String]
impressDash word = fill (sizeList word)

