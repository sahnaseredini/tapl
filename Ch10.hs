module Ch10 where

import Control.Monad

type Context = [(String, Binding)]

data Binding = NameBind | VarBind Ty deriving (Show, Eq)
data Ty = TyBool | TyArr Ty Ty deriving (Show, Eq)
data Term = TmTrue | TmFalse | TmIf Term Term Term | TmVar Int Int | TmAbs String Ty Term | TmApp Term Term


addbinding ctx x bind = ((x, bind) : ctx)

getTypeFromContext ctx i = case getbinding ctx i of 
				VarBind v -> return v
				otherwise -> Nothing
				
getbinding ctx i = snd $ ctx !! i



