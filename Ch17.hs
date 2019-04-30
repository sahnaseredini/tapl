module Ch17 where

import Control.Monad

type Context = [(String, Binding)]

data Binding = NameBind | VarBind Ty deriving (Show, Eq)

data Ty = TyRecord [(String, Ty)] 
	| TyTop
	| TyArr Ty Ty 
	deriving (Show, Eq)

data Term = TmRecord [(String, Term)] 
	| TmProj Term String
	| TmVar Int Int 
	| TmAbs String Ty Term 
	| TmApp Term Term 
	deriving (Show, Eq)

subtype :: Ty -> Ty -> Maybe Bool 
subtype _ TyTop = return True
subtype (TyArr tyS1 tyS2) (TyArr tyT1 tyT2) = liftM2 (&&) (subtype tyT1 tyS1) (subtype tyS2 tyT2)
subtype tyS tyT 
	| tyS == tyT = return True
	| otherwise = return False


