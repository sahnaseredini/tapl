
--Definition of the grammar

--data T = TRUE | FALSE | ITE T T T | ZERO | Succ T | Pred T | Iszero T deriving Show
data T = TRUE | FALSE | ITE T T T | ZERO | Succ T | Pred T | Iszero T deriving (Eq, Show)

instance Show T where
	show TRUE 	= "true"
	show FALSE 	= "false"
	show (ITE c a b)= "if " ++ (show c) ++ " then " ++ (show a) ++ " else " ++ (show b)
	show ZERO 	= "0"
	show (Succ t) 	= "succ " ++ show t
	show (Pred t) 	= "pred " ++ show t)
	show (Iszero t) = "iszero " ++ t

iszero :: T -> T
iszero t = case t of
	ZERO -> TRUE
	otherwise -> FALSE


