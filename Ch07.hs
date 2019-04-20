module Ch07 where

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


