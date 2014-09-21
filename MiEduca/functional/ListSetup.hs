import System.IO
import Control.Monad
import Data.List


-- Return: A list of Strings 
makeList :: IO ()
makeList = do
	text <- openFile "input.txt" ReadMode
	contents <- hGetContents text
	let singlewords = words contents
	--getWord singlewords
	print singlewords
	hClose text

-- Return: A list of Strins bigger than 6 characters will be inserted
getWord :: [String] -> [String]
getWord [] = []
getWord (h:t)
	| length h >= 5 = [h] ++ getWord (t)
	| otherwise = getWord (t)

wordDifficulty:: (Ord wordLetters) => [wordLetters] -> Int 
wordDifficulty (h:t) = length (h:t) - (length (h:t)  - length (nub (h:t)))

