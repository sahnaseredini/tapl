module Ch10 where

import Control.Monad

type Context = [(String, Binding)]

data Binding = NameBind | VarBind Ty deriving (Show, Eq)
data Ty = TyBool | TyArr Ty Ty deriving (Show, Eq)
data Term = TmTrue | TmFalse | TmIf Term Term Term | TmVar Int Int | TmAbs String Ty Term | TmApp Term Term deriving (Show, Eq)


addbinding ctx x bind = ((x, bind) : ctx)

getTypeFromContext ctx i = case getbinding ctx i of 
				VarBind v -> return v
				otherwise -> Nothing
				
getbinding ctx i = snd $ ctx !! i

typeOf ctx t = case t of 
		TmTrue 		-> return TyBool
		TmFalse 	-> return TyBool
		TmIf t1 t2 t3 	-> if typeOf ctx t1 == Just TyBool then 
					if tyt2 == (typeOf ctx t3) then tyt2 
					else Nothing
				   else Nothing where tyt2 = typeOf ctx t2

