import System.IO
import Control.Monad
import Data.List
import Data.Char

-- Return: A list of Strings 
makeList :: IO ()
makeList = do
	text <- openFile "input.txt" ReadMode
	contents <- hGetContents text
	let singlewords =  words contents
	
	--getWord singlewords
	print singlewords
	hClose text

-- Return: A list of Strins bigger than 6 characters will be inserted
getWord :: [String] -> [String]
getWord [] = []
getWord (h:t)
	| length h >= 5 = [h] ++ getWord (t)
	| otherwise = getWord (t)

--Return: Dificulty of the word(number of different letters in a word-- Param1: array with letters of the word--
defineWordDifficulty:: (Ord String) => [String] -> Int 
defineWordDifficulty (h:t) = length (h:t) - (length (h:t)  - length (nub (h:t)))

--Return: List with tuples with (Word, Difficulty of the word)-- Param1: List of words to generate tuple
generateWordsTuple :: [String] ->[(String,Int)]
generateWordsTuple [] = []
generateWordsTuple (h:t) =(h,defineWordDifficulty h) : generateWordsTuple t


