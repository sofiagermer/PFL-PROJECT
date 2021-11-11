--EXERCÍCIO 1.1
fibRec :: (Integral a) => a -> a

fibRec n = if n <= 1 then n
           else fibRec (n-1) + fibRec(n-2)
            
