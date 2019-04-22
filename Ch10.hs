module Ch10 where

import Control.Monad

type Context = [(String, Binding)]

data Binding = NameBind | VarBind Ty deriving (Show, Eq)
data Ty = TyBool | TyArr Ty Ty deriving (Show, Eq)
data Term = TmTrue | TmFalse | TmIf Term Term Term | TmVar Int Int | TmAbs String Ty Term | TmApp Term Term deriving (Show, Eq)

addbinding :: Context -> String -> Binding -> Context
addbinding ctx x bind = ((x, bind) : ctx)

getTypeFromContext :: Context -> Int -> Maybe Ty
getTypeFromContext ctx i = case getbinding ctx i of 
				VarBind v -> return v
				otherwise -> Nothing

getbinding :: Context -> Int -> Binding				
getbinding ctx i = snd $ ctx !! i

typeOf :: Context -> Term -> Maybe Ty
typeOf ctx t = case t of 
		TmTrue 		-> return TyBool
		TmFalse 	-> return TyBool
		TmIf t1 t2 t3 	-> if typeOf ctx t1 == Just TyBool then 
					if tyt2 == (typeOf ctx t3) then tyt2 
					else Nothing
				   else Nothing where tyt2 = typeOf ctx t2
		TmVar i _ 	-> if i < length ctx then getTypeFromContext ctx i else Nothing
		TmAbs x tyt1 t2	-> let ctx' = addbinding ctx x (VarBind tyt1) in 
					do tyt2 <- typeOf ctx' t2
					   return (TyArr tyt1 tyt2)
		TmApp t1 t2 	-> do 	tyt1 <- typeOf ctx t1 
					tyt2 <- typeOf ctx t2
				   	case tyt1 of 
						TyArr tyt11 tyt12 -> if tyt2 == tyt11 then return tyt12 else Nothing
						_ -> Nothing
		_ 		-> Nothing
