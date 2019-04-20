module Ch04 where

import Control.Monad 

data Term = TMTrue | TMFalse | TMIf Term Term Term | TMZero | TMSucc Term | TMPred Term | TMIsZero Term |NoRuleApplies deriving (Show, Eq)


isnumericval :: Term -> Bool
isnumericval t = case t of
	TMZero 		-> True
	TMSucc t1 	-> isnumericval t1
	otherwise 	-> False

isval :: Term -> Bool
isval t = case t of 
	TMTrue 		-> True
	TMFalse 	-> False
	otherwise 	-> isnumericval t

eval1 :: Term -> Maybe Term
eval1 t = case t of 
	TMIf TMTrue a b 	-> Just a
	TMIf TMFalse a b	-> Just b
	TMIf c a b 		-> (liftM (\c1 -> TMIf c1 a b) (eval1 c)) >>= eval1
	TMSucc t 		-> (liftM (TMSucc) (eval1 t)) >>= eval1
	TMPred TMZero 		-> Just TMZero
	TMPred (TMSucc nv)	-> if isnumericval nv then Just nv else Nothing
	TMPred t 		-> (liftM (TMPred) (eval1 t)) >>= eval1
	TMIsZero TMZero		-> Just TMTrue
	TMIsZero (TMSucc nv) 	-> if isnumericval nv then Just TMFalse else Nothing
	TMIsZero t 		-> (liftM (TMIsZero) (eval1 t)) >>= eval1
	otherwise 		-> Nothing
	
eval :: Term -> Maybe Term 
eval t = case eval1 t of
	Nothing -> return t
	otherwise ->  eval1 t
	
