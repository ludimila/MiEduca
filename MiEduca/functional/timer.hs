import Data.Time
import Control.Concurrent

timer (-1) = print "Tempo Acabou"
timer minutos = do print minutos
		   threadDelay (1000000 * 3)
		   timer (minutos-1)

