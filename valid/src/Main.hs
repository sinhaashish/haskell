module Main where

import Data.Char

maxLength :: String -> Maybe String
maxLength "" = Nothing 
maxLength xs =
  case (length xs >20 )  of
    True -> Nothing
    False -> Just xs

allAlpha :: String -> Maybe String
allAlpha "" = Nothing
allAlpha xs =
  case (all isAlphaNum xs ) of 
    False -> Nothing
    true -> Just xs

stripSpace :: String -> Maybe String
stripSpace "" = Nothing
stripSpace (x:xs) =
  case (isSpace x) of
    True -> stripSpace xs
    False -> Just (x:xs)

checkPassword :: String -> Maybe String
checkPassword password =
    case (stripSpace password) of
      Nothing -> Nothing
      Just password' -> 
        case allAlpha password' of
          Nothing -> Nothing
          Just password' ->
            case maxLength password' of
              Nothing -> Nothing
              Just password' -> Just password'


validatePassword :: String -> Maybe String
validatePassword password =
  stripSpace password
    >>= allAlpha
    >>= maxLength

main :: IO ()
main = do
  putStrLn "please enter a password"
  password <- getLine
  print(maxLength password)