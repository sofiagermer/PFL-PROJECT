module BigNumber (BigNumber, scanner, output) where

type Positive = Bool

type Digits = [Int]

data BigNumber = BigNumber Positive Digits

auxScanner :: String -> [Int]
auxScanner [] = []
auxScanner (x : xs) = if fromEnum x >= 48 && fromEnum x <= 57 then (fromEnum x -48) : auxScanner xs else error "Not a valid number"

scanner :: String -> BigNumber
scanner [] = error "Not a number"
scanner s@(x : xs)
  | x == '-' = BigNumber False (auxScanner xs)
  | x == '+' = BigNumber True (auxScanner xs)
  | otherwise = BigNumber True (auxScanner s)

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
output (BigNumber x y) = if x then auxOutput y else "-" ++ auxOutput y

instance Show BigNumber where
  show (BigNumber p d) = output (BigNumber p d)
