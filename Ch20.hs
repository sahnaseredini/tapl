module Ch20 where

import Control.Monad

--List
data NatList = Nil | Cons Int NatList deriving (Eq)

instance Show NatList where
	show Nil = ""
	show (Cons a Nil) = show a
	show (Cons a l) = (show a) ++ ", " ++ show l

isNil :: NatList -> Bool
isNil l = l == Nil

headL :: NatList -> Maybe Int
headL Nil 	= Nothing
headL (Cons a _)= return a
headL _ 	= Nothing

tailL :: NatList -> Maybe NatList
tailL Nil 	= Nothing
tailL (Cons _ l)= return l
tailL _ 	= Nothing

sumList :: NatList -> Int 
sumList Nil = 0
sumList (Cons a l) = a + sumList l

process a b = do 
		print $ show a
		process b (a+b)
