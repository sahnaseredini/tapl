
data Term = TMTrue | TMFalse | TMIf Term Term Term | TMZero | TMSucc Term | TMPred Term | TMIsZero Term deriving (Show, Eq)


isnumericval :: Term -> Bool
isnumericval t = case t of
	TMZero -> True
	TMSucc t1 -> isnumericval t1
	otherwise -> False

isval :: Term -> Bool
isval t = case t of 
	TMTrue -> True
	TMFalse -> False
	otherwise -> isnumericval t

eval1 :: Term -> Term
eval1 t = case t of 
	


	
