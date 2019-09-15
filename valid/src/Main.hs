module Main where

import Data.Char

maxLength :: String -> Maybe String
maxLength "" = Nothing 
maxLength xs =
  case (length xs >20 )  of
    True -> Nothing
    False -> Just xs

maxLengthEither :: String -> Either String  String
maxLengthEither "" = Left "Your Password is blank." 
maxLengthEither xs =
  case (length xs >20 )  of
    True -> Left "Your password is more than 20 character."
    False -> Right xs

allAlpha :: String -> Maybe String
allAlpha "" = Nothing
allAlpha xs =
  case (all isAlphaNum xs ) of 
    False -> Nothing
    true -> Just xs

allAlphaEither :: String -> Either String  String
allAlphaEither "" = Left " Your password is blank."
allAlphaEither xs =
  case (all isAlphaNum xs ) of 
    False -> Left "Your password is not alpha numeric."
    true -> Right xs

stripSpace :: String -> Maybe String
stripSpace "" = Nothing
stripSpace (x:xs) =
  case (isSpace x) of
    True -> stripSpace xs
    False -> Just (x:xs)

stripSpaceEither :: String -> Either String String
stripSpaceEither "" = Left " Your password is blank."
stripSpaceEither (x:xs) =
  case (isSpace x) of
    True -> stripSpaceEither xs
    False -> Right (x:xs)

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

validatePasswordEither :: String -> Either String String
validatePasswordEither password =
  stripSpaceEither password
    >>= allAlphaEither
    >>= maxLengthEither  

main :: IO ()
main = do
  putStrLn "please enter a password"
  password <- getLine
  print(maxLength password)