module Hangman where

import Data.Char
import System.IO

w = "Haskell e legal" -- Provisorio
maxI = 7

hangman :: String -> Int -> IO ()
hangman cs i | i > maxI = putStrLn "\nInfelizmente nao foi dessa vez"
             | all (`elem` cs) (map toLower w) = do
                putStrLn " "
                printWord cs
                putStrLn "\nVencedor "

hangman cs i = do
    putStrLn " "
    drawHangman i
    printWord cs
    putStrLn "\nEnsira uma letra?"
    c <- getChar >>= (return.toLower)
    if (c `elem` (map toLower w)) then
      hangman (c:cs) i 
    else do
      putStrLn $ "\n" ++ (show (i+1)) ++ " Erros\n"
      hangman cs (i+1)

printWord :: String -> IO ()
printWord cs = mapM_ pC w 
  where
    pC x  | x == ' ' = putChar ' '
          | toLower x `elem` cs = putChar x
          | otherwise = putChar '_'

main = do
  hSetBuffering stdin NoBuffering
  menu
  hangman " " 0

menu :: IO ()
menu = do
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr " |     Bem-vindo ao jogo da forca!        | \n"
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr "\n\n\n\n"
  return ()

drawHangman :: Int -> IO ()
drawHangman 0 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 1 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 2 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 3 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 4 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 5 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 6 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |  /     \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 7 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |  / \\  \n"
	putStr "  |        \n"
	putStr " -+-       \n"
