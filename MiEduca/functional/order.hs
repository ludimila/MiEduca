order :: (Ord a) => [a] -> [a]
order [] = []
order (x: xs) = 
    let compare = [a | a <- xs, a <= x]
        larger = [ a | a <- xs, a > x ]
    in order compare ++ [x] ++ order larger 
