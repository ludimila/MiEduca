module WordsTupleSetup
(
wordsTuple
)where 

import System.IO
import Data.List
import Data.Char
import System.IO.Unsafe

-- Return: A list of Strings 
generateListFromFile :: IO [String]
generateListFromFile  = do
	text <- openFile "HangmanWords.txt" ReadMode
	contents <- hGetContents text
	let singlewords = words contents
	let hangmanWords = getHangmanWords singlewords
	print hangmanWords
	hClose text
	return hangmanWords

-- Return: A list of Strins bigger than 4 characters will be inserted
getHangmanWords :: [String] -> [String]
getHangmanWords [] = []
getHangmanWords (h:t) = if length h >= 5
		then h : getHangmanWords t 
		else getHangmanWords t 

--Return: Dificulty of the word(number of different letters in a word-- Param1: array with letters of the word--
defineWordDifficulty:: (Ord words) => [words] -> Int 
defineWordDifficulty (h:t) = length (h:t) - (length (h:t)  - length (nub (h:t)))

--Return: List with tuples with (Word, Difficulty of the word)-- Param1: List of words to generate tuple -- 
generateWordsTuple :: [String] ->[(String,Int)]
generateWordsTuple [] = []
generateWordsTuple (h:t) =(h,defineWordDifficulty h) : generateWordsTuple t


wordsTuple::[(String,Int)]
wordsTuple = generateWordsTuple (unsafeDupablePerformIO generateListFromFile)


