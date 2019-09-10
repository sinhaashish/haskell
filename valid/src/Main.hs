module Main where

import Data.Char

maxLength :: String -> Maybe String
maxLength "" = Nothing 
maxLength xs =
  case (length xs >20 )  of
    True -> Nothing
    False -> Just xs

-- isAlpha :: String -> Maybe String
-- isAlpha "" -> Nothing
-- isAlpha xs =
--   case (all isAlphaNum xs ) of 
--     False -> Nothing
--     true -> Just xs

-- stripSpace :: String -> Maybe String
-- stripSpace "" = Nothing
-- stripSpace (x:xs) =
--   case (isSpace x) of
--     True -> stripSpace xs
--     False -> Just (x:xs)


main :: IO ()
main = do
  putStrLn "please enter a password"
  password <- getLine
  print(maxLength password)