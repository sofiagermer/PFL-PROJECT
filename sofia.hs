
import Data.Char

sofi :: Eq a => a -> [(a,b)] -> Maybe b
sofi k ((x,v):assocs)
  | k == x = Just v -- key found
  | otherwise = sofi k assocs
sofi k [] = Nothing -- key not found

phonebook :: [(String, String)]
phonebook = [ ("Bob", "01788 665242"), ("Fred", "01624 556442"), ("Alice", "01889 985333"), ("Jane", "01732 187565") ]

-- valida numero = if numero == 0 = Nothing oterwise numero

-- sofia :: Int -> IO ()

-- sofia = 
  --    do {
  --      str <- getLine
  --      let numerador = read str -- converte String -> Int
  --      if numerador == 0 then do putStrLn "deu merda TAS LOUCA!"
  --    }
  --    else do {
  --      do putStrLn "linda menina inteligente"
  --    }
    --    let numerador = read str -- converte String -> Int
    --    if numerador == 0
    --      do putStrLn "deu merda TAS LOUCA!"
    --    else
    --      do putStrLn "linda menina inteligente"

safeLog :: (Floating a, Ord a) => a -> Maybe a
safeLog x
    | x ==0  = Nothing
    | otherwise = Just (x)