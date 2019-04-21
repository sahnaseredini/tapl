module Ch07 where

import Control.Monad

data Term = TMVar Int Int | TMAbs String Term | TMApp Term Term deriving Show
type Context = [String]

printtm :: Context -> Term -> String
printtm ctx t = case t of
	TMAbs x t1 -> let (ctx', x') = (pickFreshName ctx x) in
			 "(lambda " ++ x' ++ ". " ++ (printtm ctx' t1) ++ ")"
	TMApp t1 t2 -> "(" ++ printtm ctx t1 ++ " " ++ printtm ctx t2 ++ ")"
	TMVar x n -> if length ctx == n then (reverse ctx) !! x else "[bad index]"


pickFreshName :: Context -> String -> (Context, String)
pickFreshName ctx x = ((ctx ++ [x']), x') where x' = newName ctx x where
								newName [] x = x
								newName (f:ctx') x = if f == x then (newName ctx (x ++ "'")) else (newName ctx' x)

--termShift 2 (TMAbs "1" (TMAbs "2" (TMApp (TMVar 0 1) (TMApp (TMVar 1 2) (TMVar 2 3)))))
--TMAbs "1" (TMAbs "2" (TMApp (TMVar 0 3) (TMApp (TMVar 1 4) (TMVar 4 5))))

termShift d t = walk 0 t where walk c t = case t of 
						TMVar x n -> if x >= c then (TMVar (x + d) (n + d)) else (TMVar x (n + d))
						TMAbs x t1 -> TMAbs x (walk (c+1) t1)
						TMApp t1 t2 -> TMApp (walk c t1) (walk c t2)

termSubst j s t = walk 0 t where walk c t = case t of 
						TMVar x n -> if x == (j + c) then termShift c s else (TMVar x n)
						TMAbs x t1 -> TMAbs x (walk (c+1) t1)
						TMApp t1 t2 -> TMApp (walk c t1) (walk c t2)

termSubstTop s t = termShift (-1) (termSubst 0 (termShift 1 s) t)

isval ctx t = case t of 
	TMAbs _ _ 	-> True
	_ 		-> False

eval1 :: Context -> Term -> Maybe Term
eval1 ctx t = case t of
	TMApp (TMAbs x t12) v2 	-> if isval ctx v2 then Just (termSubstTop v2 t12) else Nothing
	TMApp t1 t2 		-> if isval ctx t1 then (liftM (TMApp t1) (eval1 ctx t2)) >>= eval1 ctx else (liftM ((flip TMApp) t2) (eval1 ctx t1))  
	TMAbs x t1  		-> return (TMAbs x t1)
	TMVar x n		-> return (TMVar x n)
        otherwise               -> Nothing


eval :: Context -> Term -> Maybe Term
eval ctx t = case eval1 ctx t of
        Nothing -> return t
        otherwise ->  eval1 ctx t
