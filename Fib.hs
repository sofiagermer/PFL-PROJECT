import BigNumber (BigNumber (Negative, Positive), output, somaBN, subBN, somaBNAux, subBNAux)

-- =======================================================================================
--EXERCÍCIO 1
-- -------------------------------------------------------------------------------
--EX 1.1 : implementação recursiva do cálculo do enésimo número de Fibonnaci
fibRec :: (Integral a) => a -> a
fibRec n =
  if n <= 1 then n
  else fibRec (n -1) + fibRec (n -2)

-- -------------------------------------------------------------------------------
--EX 1.2 : implemenação otimizada da função anterior (programação dinâmica)

fibLista :: Integer -> Integer 
fibLista n = last (fibListaAux1 n)

fibListaAux1 :: Integer -> [Integer]
fibListaAux1 0 = [1]
fibListaAux1 1 = [1,1]
fibListaAux1 n = [1,1] ++ fibListaAux 1 1 (n-2)

fibListaAux :: Integer -> Integer -> Integer  -> [Integer]
fibListaAux a b 0 = []
fibListaAux a b n = (a+b) : fibListaAux (a+b) a (n-1)


-- -------------------------------------------------------------------------------
-- EX 1.3 - implementação com auxílio de uma lista infinita para o cálculo do enésimo número de Fibonnaci

fibs :: [Integer]
fibs = [0] ++ [1] ++ zipWith (+) fibs (tail fibs)

fibListaInfinita :: Int -> Integer
fibListaInfinita n = fibs !! n


-- =======================================================================================
-- EX 3.1
fibRecBN :: BigNumber -> BigNumber
fibRecBN n
  | n == Positive [0] = Positive [0]
  | n == Positive [1] = Positive [1]
  | otherwise = somaBN (fibRecBN (subBN n (Positive [1]))) (fibRecBN (subBN n (Positive [2])))

-- -------------------------------------------------------------------------------
-- EX 3.2 
-- fibListaAuxBN :: [BigNumber] -> BigNumber
-- fibListaAuxBN [Positive [0]] = Positive [0]
-- fibListaAuxBN [Positive [1]] = Positive [1]
-- fibListaAuxBN [b] = somaBN (fibListaAuxBN [subBN b (Positive [1])]) (fibListaAuxBN [subBN b (Positive [2])])
--fibListaAuxBN :: [BigNumber] -> BigNumber
--fibListaAuxBN [Positive [0]] = Positive [0]
--fibListaAuxBN [Positive [1]] = Positive [1]
--fibListaAuxBN [b] = somaBN (fibListaAuxBN [subBN b (Positive [1])]) (fibListaAuxBN [subBN b (Positive [2])])

fibListaBN :: BigNumber  -> BigNumber  
fibListaBN (Positive d1) = Positive (last (fibListaAux1 d1))
fibListaBN (Negative d1) = Positive [0]

-- o número que cremos como indice na sequencia de fibonnacci é representado como uma lista de dígitos
fibListaAux1BN :: [Integer] -> [Integer]
fibListaAux1BN 0 = [1]
fibListaAux1BN 1 = [1,1]
fibListaAux1BN n = [1,1] ++ fibListaAux 1 1 (subBNAux n [2])

fibListaAuxBN :: [Integer] -> [Integer] -> [Integer]  -> [Integer]
fibListaAuxBN a b 0 = []
fibListaAuxBN a b n = (somaBN a b) : fibListaAux (somaBN a b) a (subBN (Positive n) (Positive[2]))

-- -------------------------------------------------------------------------------
-- EX 3.3 

-- fibListaInfinitaBN :: BigNumber -> BigNumber 
-- fibListaInfinitaBN b = [fibListaBN x | x<-[0..]] !! 