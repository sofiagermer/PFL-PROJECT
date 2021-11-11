--EXERCÍCIO 1.1
fibRec :: (Integral a) => a -> a

fibRec n = if n <= 1 then n
           else fibRec (n-1) + fibRec(n-2)

--EXERCÍCIO 1.2
fibLista :: (Integral a) => a -> a

fibLista x = fibListaAux[x]
fibListaAux[0] = 0;
fibListaAux[1] = 1;
fibListaAux[x] = fibListaAux[x-1] + fibListaAux[x-2] 


