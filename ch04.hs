
data Term = TMTrue | TMFalse | TMIf Term Term Term | TMZero | TMSucc Term | TMPred Term | TMIsZero Term deriving (Show, Eq)


isnumericval :: Term -> Bool
isnumericval t = case t of
	TMZero -> True
	TMSucc t1 -> isnumericval t1
	otherwise -> False
