module BigNumber (BigNumber, scanner) where

data BigNumber
  = Positive [Int]
  | Negative [Int]
  deriving (Show)

auxScanner :: String -> [Int]
auxScanner [] = []
auxScanner (x : xs) = if fromEnum x >= 48 && fromEnum x <= 57 then (fromEnum x -48) : auxScanner xs else error "Not a valid number"

scanner :: String -> BigNumber
scanner [] = error "Not a number"
scanner s@(x : xs)
  | x == '-' = Negative (auxScanner xs)
  | x == '+' = Positive (auxScanner xs)
  | otherwise = Positive (auxScanner s)

isPositive :: BigNumber -> Bool
isPositive (Positive d) = True
isPositive (Negative d) = False 
isNegative :: BigNumber -> Bool
isNegative (Positive d) = False 
isNegative (Negative d) = True

intToChar :: Int -> Char
intToChar i
  | i == 0 = '0'
  | i == 1 = '1'
  | i == 2 = '2'
  | i == 3 = '3'
  | i == 4 = '4'
  | i == 5 = '5'
  | i == 6 = '6'
  | i == 7 = '7'
  | i == 8 = '8'
  | i == 9 = '9'
  | otherwise = error "Error converting int to char"

auxOutput :: [Int] -> String
auxOutput = foldr (\x -> (++) [intToChar x]) ""

output :: BigNumber -> String
output (Positive d) = auxOutput d
output (Negative d) = "-" ++ auxOutput d

--Funções auxiliares que devolvem lista maior

listaMaiorAux1 :: [Int] -> [Int] -> Int
listaMaiorAux1 [] [] = 3
listaMaiorAux1 l1 l2
  | head l1 > head l2 = 1
  | head l2 > head l1 = 2
  | otherwise = listaMaiorAux1 (tail l1) (tail l2)

listaMaior :: [Int] -> [Int] -> [Int]
listaMaior l1 l2
  | listaMaiorAux1 l1 l2 == 1 = l1
  | listaMaiorAux1 l1 l2 == 2 = l2
  | otherwise = l1

-- -------------------------------------------------------------------------------
-- -- Função que soma dois Big Numbers

somaAux1 :: [Int] -> [Int] -> Int -> [Int]
somaAux1 [] [] overflow = [overflow | overflow /= 0]
somaAux1 el [] overflow = el
somaAux1 [] el overflow = el
somaAux1 (x : xs) (y : ys) overflow
  | (x + y + overflow) < 10 = (x + y + overflow) : somaAux1 xs ys 0
  | div (x + y + overflow) 10 > 0 = mod (x + y + overflow) 10 : somaAux1 xs ys (div (x + y + overflow) 10)
  | div (x + y + overflow) 10 == 0 = mod (x + y + overflow) 10 : somaAux1 xs ys (div (x + y + overflow) 10)
  | otherwise = [1]

-- -- por causa do overflow
somaAux2 :: [Int] -> [Int] -> [Int]
somaAux2 l1 l2 = reverse (somaAux1 (reverse l1) (reverse l2) 0)

-- -- para quando somamos numeros com quantidades diferentes de dígitos
somaBNAux :: [Int] -> [Int] -> [Int]
somaBNAux y1 y2
  | length y1 > length y2 = somaAux2 y1 (replicate (length y1 - length y2) 0 ++ y2)
  | length y2 > length y1 = somaAux2 (replicate (length y2 - length y1) 0 ++ y1) y2
  | otherwise = somaAux2 y1 y2

-- --faz a gestão dos sinais
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN (Positive d1) (Positive d2) = Positive (somaBNAux d1 d2)
somaBN (Negative d1) (Negative d2) = Negative (somaBNAux d1 d2)
-- somaBN (Positive d1) (Negative d2) = subBN (Positive d1) (Positive d2)
-- somaBN (Negative d1) (Positive d2) = subBN (Positive d2) (Positive d1)


-- -------------------------------------------------------------------------------
-- --Função que subtrai dois BigNumbers
subAux1 :: [Int] -> [Int] -> Int -> [Int]
subAux1 [] [] overflow = [overflow | overflow /= 0]
subAux1 el [] overflow = el
subAux1 [] el overflow = el
subAux1 (x : xs) (y : ys) overflow
  | x < y = (10 - y - overflow) : subAux1 xs ys 1
  | (x == y + overflow) && null xs = [] --para não aparecer 0 no início do número
  | abs (x - y - overflow) < 10 = (x - y - overflow) : subAux1 xs ys 0
  | otherwise = [1]

subAux2 :: [Int] -> [Int] -> [Int]
subAux2 l1 l2 = reverse (subAux1 (reverse l1) (reverse l2) 0)

-- -- para quando somamos numeros com quantidades diferentes de dígitos : x -y
-- subBNAux :: BigNumber -> BigNumber -> BigNumber
-- subBNAux (BigNumber x1 y1) (BigNumber x2 y2)
--   | length y1 > length y2 = BigNumber '+' (subAux2 y1 (replicate (length y1 - length y2) 0 ++ y2))
--   | length y2 > length y1 = BigNumber '-' (subAux2 y2 (replicate (length y2-length y1) 0 ++ y1))
--   | listaMaior y1 y2 == y1 =  BigNumber '+' (subAux2 y1 y2)
--   | listaMaior y1 y2 == y2 = BigNumber '-' (subAux2 y2 y1)
--   | otherwise = BigNumber '+'[] --erro

-- subBN :: BigNumber -> BigNumber -> BigNumber
-- subBN (BigNumber x1 y1) (BigNumber x2 y2)
--   | x1 == '-' && x2 == '+' = BigNumber '-' (somaBNAux y1 y2)
--   | x1 == '+' && x2 == '-' = BigNumber '+' (somaBNAux y1 y2)
--   | x1 == '+' && x2 == '+' = subBNAux (BigNumber x1 y1) (BigNumber x2 y2)
--   | x1 == '-' && x2 == '-' = subBNAux (BigNumber x2 y2) (BigNumber x1 y1)
--   | otherwise = BigNumber '-' [1, 2, 3, 4]

-- -------------------------------------------------------------------------------

-- mulAux1 :: Digits -> Int -> Digits
-- mulAux1 xs el = map (* el) xs

-- mulAux2 :: Digits -> Digits -> Int -> Int -> Digits
-- mulAux2 [] [] counter stop = []
-- mulAux2 el [] counter stop = []
-- mulAux2 [] el counter stop = []
-- mulAux2 lista1 lista2 counter 0 = []
-- mulAux2 lista (y : ys) counter stop = replicate counter 0 ++ somaBNAux (mulAux1 lista y) (mulAux2 lista ys (counter + 1) (stop -1))

-- mulAux :: Digits -> Digits -> Digits
-- mulAux l1 l2 = reverse (mulAux2 (reverse l1) (reverse l2) 0 (length l2))

-- mulBN :: BigNumber -> BigNumber -> BigNumber
-- mulBN (BigNumber x1 y1) (BigNumber x2 y2)
--   | x1 == '+' && x2 == '+' = BigNumber '+' (mulAux y1 y2)
--   | x1 == '-' && x2 == '-' = BigNumber '+' (mulAux y1 y2)
--   | otherwise = BigNumber '-' (mulAux y1 y2)

----------------

-- divBN :: BigNumber -> BigNumber -> BigNumber

-- divBN (BigNumber s1 d1) (BigNU)