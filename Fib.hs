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
fibListaAux1 0 = [0]
fibListaAux1 1 = [0,1]
fibListaAux1 n = [0,1,1] ++ fibListaAux 1 1 (n-2)

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
-- EX 3.1 : exercício 1.1 aplicado a BigNumbers
fibRecBN :: BigNumber -> BigNumber
fibRecBN n
  | n == Positive [0] = Positive [0]
  | n == Positive [1] = Positive [1]
  | otherwise = somaBN (fibRecBN (subBN n (Positive [1]))) (fibRecBN (subBN n (Positive [2])))

-- -------------------------------------------------------------------------------
-- EX 3.2 - exercício 1.2 aplicado a BigNumbers
fibListaBN :: BigNumber  -> BigNumber
fibListaBN (Positive d1) = Positive (last (fibListaAux1BN d1))
fibListaBN (Negative d1) = Positive [0]

-- o número que cremos como indice na sequencia de fibonnacci é representado como uma lista de dígitos
fibListaAux1BN :: [Int] -> [[Int]]
fibListaAux1BN [0] = [[0]]
fibListaAux1BN [1] = [[0],[1]]
fibListaAux1BN n = [[0],[1],[1]] ++ fibListaAuxBN [1] [1] (subBNAux n [2])

fibListaAuxBN :: [Int] -> [Int] -> [Int]  -> [[Int]]
fibListaAuxBN a b [] = []
fibListaAuxBN a b n = somaBNAux a b : fibListaAuxBN (somaBNAux a b) a (subBNAux n [1])

-- -------------------------------------------------------------------------------
-- EX 3.3 - exercício 1.3 aplciado a BigNumbers

convertToInt :: [Int] -> Int
convertToInt = foldl addDigit 0
   where addDigit numero d = 10*numero + d

fibsBN :: [[Int]]
fibsBN = [[0]] ++ [[1]] ++ zipWith somaBNAux fibsBN (tail fibsBN)

fibListaInfinitaBN :: BigNumber -> BigNumber 
fibListaInfinitaBN (Positive n) = Positive (fibsBN !! convertToInt (reverse n))
fibListaInfinitaBN (Negative n) = Positive [0] 

---------------------------------------------------------------------------------
-- EX 4 - funções auxiliares para comparar a eficiência de Int e Integer
fibRecInt :: Int -> Int
fibRecInt n =
  if n <= 1 then n
  else fibRec (n -1) + fibRec (n -2)

fibRecInteger :: Integer -> Integer
fibRecInteger n =
  if n <= 1 then n
  else fibRec (n -1) + fibRec (n -2)
