module Main where

import Data.Char

newtype Password =
  Password String deriving  (Eq, Show)
newtype Error =
  Error String deriving  (Eq, Show)
newtype Username =
  Username String deriving  (Eq, Show)

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

passwordLength :: String -> Either Error Password
passwordLength "" = Left (Error "Your Password is blank.")
passwordLength password =
  case (length password >20 )  of
    True -> Left (Error"Your password is more than 20 character.")
    False -> Right (Password password) 

usernameLength :: String -> Either Error Username
usernameLength username =
  case (length username >16 )  of
    True -> Left (Error"Your Username is more than 16 character.")
    False -> Right (Username username) 
  

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

allAlphaUserPass ::   String -> Either Error  String
allAlphaUserPass "" = Left (Error" Your password is blank.")
allAlphaUserPass xs =
  case (all isAlphaNum xs ) of 
    False -> Left (Error"Your password is not alpha numeric.")
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


stripSpaceUserPass :: String -> Either Error String
stripSpaceUserPass "" = Left (Error" Your password is blank.")
stripSpaceUserPass (x:xs) =
  case (isSpace x) of
    True -> stripSpaceUserPass xs
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

validatePass :: Password -> Either Error Password
validatePass (Password password) =
  stripSpaceUserPass password
    >>= allAlphaUserPass
    >>= passwordLength 

main :: IO ()
main = do
  putStrLn "please enter a password"
  password <- Password <$> getLine
  print(validatePass password)