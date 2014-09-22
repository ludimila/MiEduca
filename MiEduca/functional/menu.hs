menu :: IO ()
menu = do
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr " |     Bem-vindo ao jogo da forca!        | \n"
  putStr "  +--+--+--+--+--+--+--+--+--+--+--+--+--+  \n"
  putStr "\n\n\n\n"
  drawHangman 0
  drawHangman 1
  drawHangman 2
  drawHangman 3
  drawHangman 4
  drawHangman 5
  drawHangman 6
  drawHangman 7
  return ()

drawHangman :: Int -> IO ()
drawHangman 0 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 1 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 2 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  |   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 3 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 4 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 5 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |        \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 6 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |  /     \n"
	putStr "  |        \n"
	putStr " -+-       \n"

drawHangman 7 = do
	putStr "            Entre com uma letra =)     \n\n\n"
	putStr "   ___     \n"
	putStr "  /   |    \n"
	putStr "  |   O    \n"
	putStr "  | --|--  \n"
	putStr "  |   |    \n"
	putStr "  |  / \\  \n"
	putStr "  |        \n"
	putStr " -+-       \n"
