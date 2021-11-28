module BigNumber (BigNumber (Positive, Negative), scanner, output, somaBN, subBN, mulBN, divBN) where

data BigNumber
  = Positive [Int]
  | Negative [Int]
  deriving (Show, Eq)

instance Ord BigNumber where
  Negative d1 <= Positive d2 = True
  Positive d1 <= Negative d2 = False
  Negative d1 <= Negative d2 = length d1 <= length d2 || reverse d1 <= reverse d2
  Positive d1 <= Positive d2 = length d1 <= length d2 && reverse d1 <= reverse d2

auxScanner :: String -> [Int]
auxScanner [] = []
auxScanner (x : xs) = if fromEnum x >= 48 && fromEnum x <= 57 then (fromEnum x -48) : auxScanner xs else error "Not a valid number"

scanner :: String -> BigNumber
scanner [] = error "Not a number"
scanner s@(x : xs)
  | x == '-' = Negative (reverse (auxScanner xs))
  | x == '+' = Positive (reverse (auxScanner xs))
  | otherwise = Positive (reverse (auxScanner s))

isPositive :: BigNumber -> Bool
isPositive (Positive d) = True
isPositive (Negative d) = False


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
output (Positive d) = reverse (auxOutput d)
output (Negative d) = "-" ++ reverse (auxOutput d)

-- -------------------------------------------------------------------------------
--Funções auxiliares que devolvem lista maior

listaMaiorAux1 :: [Int] -> [Int] -> Int
listaMaiorAux1 [] [] = 3
listaMaiorAux1 l1 l2
  | length l1 > length l2 = 1
  | length l2 > length l1 = 2
  | last l1 > last l2 = 1
  | last l2 > last l1 = 2
  | otherwise = listaMaiorAux1 (init l1) (init l2)

listaMaior :: [Int] -> [Int] -> [Int]
listaMaior l1 l2
  | listaMaiorAux1 l1 l2 == 1 = l1
  | listaMaiorAux1 l1 l2 == 2 = l2
  | otherwise = l1

-- -------------------------------------------------------------------------------
-- -- Função que soma dois Big Numbers

somaBNAux1 :: [Int] -> [Int] -> Int -> [Int]
somaBNAux1 [] [] overflow = [overflow | overflow /= 0]
somaBNAux1 el [] overflow = el
somaBNAux1 [] el overflow = el
somaBNAux1 (x : xs) (y : ys) overflow
  | x + y + overflow < 10 = (x + y + overflow) : somaBNAux1 xs ys 0
  | div (x + y + overflow) 10 > 0 = mod (x + y + overflow) 10 : somaBNAux1 xs ys (div (x + y + overflow) 10)
  | otherwise = []

-- -- para quando somamos numeros com quantidades diferentes de dígitos
somaBNAux :: [Int] -> [Int] -> [Int]
somaBNAux y1 y2
  | length y1 > length y2 = somaBNAux1 y1 (y2 ++ replicate (length y1 - length y2) 0) 0
  | length y2 > length y1 = somaBNAux1 (y1 ++ replicate (length y2 - length y1) 0) y2 0
  | otherwise = somaBNAux1 y1 y2 0

-- --faz a gestão dos sinais
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN (Positive d1) (Positive d2) = Positive (somaBNAux d1 d2)
somaBN (Negative d1) (Negative d2) = Negative (somaBNAux d1 d2)
somaBN (Positive d1) (Negative d2) = subBN (Positive d1) (Positive d2)
somaBN (Negative d1) (Positive d2) = subBN (Positive d2) (Positive d1)

-- -------------------------------------------------------------------------------
-- --Função que subtrai dois BigNumbers
subAux1 :: [Int] -> [Int] -> Int -> [Int]
subAux1 [] [] overflow = [overflow | overflow /= 0]
subAux1 el [] overflow = el
subAux1 [] el overflow = el
subAux1 (x : xs) (y : ys) overflow
  | x < (y + overflow) = ((10 + x) - y - overflow) : subAux1 xs ys 1
  | x == y + overflow && null xs = [] --para não aparecer 0 no início do número
  | abs (x - y - overflow) < 10 = (x - y - overflow) : subAux1 xs ys 0
  | otherwise = []

-- para quando somamos numeros com quantidades diferentes de dígitos : x -y
subBNAux :: [Int] -> [Int] -> BigNumber
subBNAux y1 y2
  | length y1 > length y2 = Positive (subAux1 y1 (y2 ++ replicate (length y1 - length y2) 0) 0)
  | length y2 > length y1 = Negative (subAux1 y2 (y1 ++ replicate (length y2 - length y1) 0) 0)
  | listaMaior y1 y2 == y1 = Positive (subAux1 y1 y2 0)
  | listaMaior y1 y2 == y2 = Negative (subAux1 y2 y1 0)
  | otherwise = Positive []

subBN :: BigNumber -> BigNumber -> BigNumber
subBN (Positive d1) (Negative d2) = Positive (somaBNAux d1 d2)
subBN (Negative d1) (Positive d2) = Negative (somaBNAux d1 d2)
subBN (Positive d1) (Positive d2) = if Positive d1 == Positive d2 then Positive [0] else subBNAux d1 d2
subBN (Negative d1) (Negative d2) = if Positive d1 == Positive d2 then Positive [0] else subBNAux d2 d1

-- -------------------------------------------------------------------------------
-- --Função que subtrai dois BigNumbers
mulAux1 :: [Int] -> Int -> [Int]
mulAux1 xs el = map (* el) xs

mulAux2 :: [Int] -> [Int] -> Int -> Int -> [Int]
mulAux2 [] [] counter stop = []
mulAux2 el [] counter stop = []
mulAux2 [] el counter stop = []
mulAux2 lista1 lista2 counter 0 = []
mulAux2 lista (y : ys) counter stop = replicate counter 0 ++ somaBNAux (mulAux1 lista y) (mulAux2 lista ys (counter + 1) (stop -1))

mulBN :: BigNumber -> BigNumber -> BigNumber
mulBN (Positive d1) (Positive d2) = Positive (mulAux2 d1 d2 0 (length d2))
mulBN (Negative d1) (Negative d2) = Positive (mulAux2 d1 d2 0 (length d2))
mulBN (Positive d1) (Negative d2) = Negative (mulAux2 d1 d2 0 (length d2))
mulBN (Negative d1) (Positive d2) = Negative (mulAux2 d1 d2 0 (length d2))

-- -------------------------------------------------------------------------------

-- divBN :: BigNumber -> BigNumber -> BigNumber

-- divBN (BigNumber s1 d1) (BigNU)

divBNrecursive :: BigNumber ->BigNumber-> BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBNrecursive r d q s= if r >= d then divBNrecursive (subBN r d) d (somaBN q (Positive [1])) s else (mulBN q s, r)

divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBN (Positive d1) (Positive d2) = divBNrecursive (Positive d1) (Positive d2) (Positive [0]) (Positive [1])
divBN (Negative d1) (Positive d2) = divBNrecursive (Positive d1) (Positive d2) (Positive [0]) (Negative [1])
divBN (Positive d1) (Negative d2) = divBNrecursive (Positive d1) (Positive d2) (Positive [0]) (Negative [1])
divBN (Negative d1) (Negative d2) = divBNrecursive (Positive d1) (Positive d2) (Positive [0]) (Positive [1])
 
-- -------------------------------------------------------------------------------
getBigNumberDigits :: BigNumber -> [Int]
getBigNumberDigits (Positive d1) = d1
getBigNumberDigits (Negative d1) = d1
-- -------------------------------------------------------------------------------

safeDivBN :: BigNumber -> BigNumber -> Maybe(BigNumber,BigNumber)
safeDivBN numerador denominador
  | head(getBigNumberDigits denominador) == 0 && length(getBigNumberDigits denominador) == 1 = Nothing
  | otherwise = Just (divBN numerador denominador)

