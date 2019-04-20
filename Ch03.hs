module Ch03 where

--Definition of the grammar

--data T = TRUE | FALSE | ITE T T T | ZERO | Succ T | Pred T | Iszero T deriving Show
data T = TRUE | FALSE | ITE T T T | ZERO | Succ T | Pred T | Iszero T  deriving Eq


instance Show T where
	show TRUE 	= "true"
	show FALSE 	= "false"
	show (ITE c a b)= "if " ++ (show c) ++ " then " ++ (show a) ++ " else " ++ (show b)
	show ZERO 	= "0"
	show (Succ t) 	= "succ " ++ t
	show (Pred t) 	= "pred " ++ t 
	show (Iszero t) = "iszero " ++ show t

iszero :: T -> T
iszero t = case t of
	ZERO -> TRUE
	otherwise -> FALSE

--Evaluation process

eval :: T -> Maybe T
eval t = case t of
	TRUE -> Just t 
	FALSE -> Just t 
	ITE t1 t2 t3 -> if (eval t1) == (eval TRUE) then eval t2 
			else if (eval t1) == (eval FALSE) then eval t3 
			else Nothing
	ZERO -> Just t
	Iszero t -> if t == ZERO then Just TRUE else Just FALSE
	
	


