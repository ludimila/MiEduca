module Interface
( 
 
printHello,
drawHangman,
printWord

)where

import Data.Char

printHello :: IO ()
printHello  = do
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr " |     Bem-vindo ao jogo da forca!        | \n"
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr "\n\n"  	
  return ()

drawHangman :: Int -> IO ()
drawHangman 0 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |        \n"
	putStr "  |       Entre com uma letra =) \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()

drawHangman 1 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |       Entre com uma letra =) \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 2 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |   |    Entre com uma letra =)\n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 3 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|    Entre com uma letra =)\n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 4 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  Entre com uma letra =)\n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 5 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  Entre com uma letra =)\n"
	putStr "  |   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 6 = do
	putStr "                 \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  Entre com uma letra =)\n"
	putStr "  |   |    \n"
	putStr "  |  /     \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()


drawHangman 7 = do
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--   Voce perdeu \n"
	putStr "  |   |    \n"
	putStr "  |  / \\  \n"
	putStr "  |        \n"
	putStr " -+-       \n"
	return ()

drawHangman _ = return ()

printWord :: String -> String -> IO ()
printWord hs cr = mapM_ pC cr
  where
    pC x  | x == ' ' = putChar ' '
          | toLower x `elem` hs = putChar x
          | otherwise = putChar '_'
