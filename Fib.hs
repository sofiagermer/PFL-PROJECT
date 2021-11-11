--EXERCÍCIO 1.1
fibRec :: (Integral a) => a -> a

fibRec n = if n <= 1 then n
           else fibRec (n-1) + fibRec(n-2)

--EXERCÍCIO 1.2
fibLista :: (Integral a) => a -> a

fibLista n = fibListaAux[n]
fibListaAux[0] = 0;
fibListaAux[1] = 1;
fibListaAux[n] = fibListaAux[n-1] + fibListaAux[n-2] 

-- EXERCÍCIO 1.3
fibListaInfinitaAux :: [Integer]
fibListaInfinitaAux = 0 : 1 : [a+b | (a,b)<-zip fibListaInfinitaAux (tail fibListaInfinitaAux)]

fibListaInfinita :: Int -> Integer
fibListaInfinita n = fibListaInfinitaAux!! n

