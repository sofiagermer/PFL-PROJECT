import BigNumber (BigNumber (Negative, Positive), somaBN, subBN,output)

-- -------------------------------------------------------------------------------
--EX 1.1
fibRec :: (Integral a) => a -> a
fibRec n =
  if n <= 1
    then n
    else fibRec (n -1) + fibRec (n -2)

-- -------------------------------------------------------------------------------
--EX 1.2

fibLista :: (Integral a) => a -> a
fibLista = fibListaAux 0 1


-- fibListaAux :: Integer -> Integer -> Integer  -> Integer
fibListaAux a b 0 = a
fibListaAux a b n = fibListaAux (a+b) a (n-1)

-- -------------------------------------------------------------------------------
-- EX 1.3

fibs :: [Integer]
fibs = [0] ++ [1] ++ zipWith (+) fibs (tail fibs)

fibListaInfinita :: Int -> Integer
fibListaInfinita n = fibs !! n

-- -------------------------------------------------------------------------------
-- EX 3
fibRecBN :: BigNumber  -> BigNumber
fibRecBN n
  | n == Positive [0] = Positive [0]
  | n == Positive [1] = Positive [1]
  | otherwise = somaBN (fibRecBN (subBN n (Positive [1]))) (fibRecBN (subBN n (Positive [2])))

fibListaAuxBN :: [BigNumber] -> BigNumber
--fibListaAuxBN [Positive [0]] = Positive [0]
--fibListaAuxBN [Positive [1]] = Positive [1]
fibListaAuxBN [b] = somaBN (fibListaAuxBN [subBN b (Positive [1])]) (fibListaAuxBN [subBN b (Positive [2])])

