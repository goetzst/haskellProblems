module Main where

main :: IO ()
main = undefined

{----------- PROBLEM 1 -----------}
-- Find the last elemenf of a list
-- without Maybe
-- as safe as head
p1 :: [a] -> a
p1 [x] = x
p1 (x:xs) = p1 xs
p1 []  = error "Main.p1: empty list"

-- using head and drop
p1' :: [a] -> a
p1' xs = head $ drop (length xs -1) xs

-- using head . drop because pointfree
p1'' :: [a] -> a
p1'' xs = (head . drop (length xs -1)) xs

p1''' xs  = xs !! (length xs -1)

-- taken from https://wiki.haskell.org/99_questions/1_to_10
p1'''' :: [a] -> a
p1'''' = foldr1 (curry snd)
{----------- PROBLEM 2 -----------}
-- Find the last but one element of a list.
-- without Maybe
-- as safe as head
p2 :: [a] -> a
p2 (x:[y])  = x
p2 (x:xs)   = p2 xs

p2' :: [a] -> a
p2' xs = head $ drop (length xs -2) xs

p2'' xs = xs !! (length xs -2)

p2''' (_:xs)  = p1 xs

-- taken from https://wiki.haskell.org/99_questions/1_to_10
p2'''' :: [a] -> Maybe a 
p2'''' = fst . foldl (\(a,b) c -> (b, Just c)) (Nothing, Nothing)
