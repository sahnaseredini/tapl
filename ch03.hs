
--Definition of the grammar

data T = TRUE | FALSE | ITE T T T | ZERO | Succ T | Pred T | Iszero T deriving Show
