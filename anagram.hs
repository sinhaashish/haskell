import Data.List
import Data.Char (isAlpha)

isAnagram :: String -> String -> Bool
isAnagram word1 word2 = sort(word1) == sort(word2)


isWord :: String -> Maybe String
isWord word= 
    case null word of
        True -> Nothing
        False -> 
            case (all isAlpha word) of  
                False -> Nothing
                True -> Just word

 
areAnagrams :: String -> String -> String
areAnagrams word1 word2= 
    case isWord word1 of
        Nothing -> " word1 is not a word"
        Just word1 ->
            case isWord word2 of 
                Nothing -> " Word 2 is not a word"
                Just word2 ->
                    case (isAnagram word1 word2) of 
                        False -> " Words are not anagrams"
                        True -> " Words are anagrams" 

main :: IO()
main = do
    print( " Please enter a word")
    word1 <- getLine
    print (" Please enter a second word")
    word2 <- getLine
    print( areAnagrams word1 word2) 