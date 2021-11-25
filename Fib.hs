import BigNumber (BigNumber (Negative, Positive), somaBN, subBN,output)

--EX 1.1
fibRec :: (Integral a) => a -> a
fibRec n =
  if n <= 1
    then n
    else fibRec (n -1) + fibRec (n -2)

--EX 1.2

fibListaAux :: (Integral a) => [a] -> a
fibListaAux [0] = 0
fibListaAux [1] = 1
fibListaAux [n] = fibListaAux [n -1] + fibListaAux [n -2]

fibLista :: (Integral a) => a -> a
fibLista n = fibListaAux [n]

-- EX 1.3

fibListaInfinita :: Int -> Integer
fibListaInfinita n = [fibLista x | x <- [0 ..]] !! n

-- EX 3
fibRecBN :: BigNumber  -> BigNumber
fibRecBN n
  | n == Positive [0] = Positive [0]
  | n == Positive [1] = Positive [1]
  | otherwise = somaBN (fibRecBN (subBN n (Positive [1]))) (fibRecBN (subBN n (Positive [2])))

fibListaAuxBN :: [BigNumber] -> BigNumber 
fibListaAuxBN [Positive [0]] = Positive [0]
fibListaAuxBN [Positive [1]] = Positive [1]
fibListaAuxBN [b] = somaBN (fibListaAuxBN [subBN b (Positive [1])]) (fibListaAuxBN [subBN b (Positive [2])])

