module Ch11to14 where

import Control.Monad

type Context = [(String, Binding)]

data Binding = NameBind | VarBind Ty deriving (Show, Eq)
data Ty = TyBool 
	| TyArr Ty Ty 
	| TyA 
	| TyUnit 
	| TyPair Ty Ty 
	| TyTuple [Ty] 
	| TyRecord [(String, Ty)] 
	| TySum SumT 
	| TyList Ty
	| TyError
	deriving (Show, Eq)

data Term = TmTrue 
	| TmFalse 
	| TmIf Term Term Term 
	| TmVar Int Int 
	| TmAbs String Ty Term 
	| TmApp Term Term 
	| TmUnit 
	| TmAs Term Ty 
	| TmLet String Term Term 
	| TmPair Term Term 
	| TmTuple [Term] 
	| TmRecord [(String, Term)] 
	| TmSum Sum 
	| TmNil [Ty]
	| TmCons [Ty] Term Term
	| TmIsNil [Ty] Term
	| TmHead [Ty] Term
	| TmTail [Ty] Term
	| TmError
	| TmTry Term Term
	| TmRaise Term
	deriving (Show, Eq)

data Sum = Inl Term | Inr Term deriving (Show, Eq)

data SumT = InlT Ty | InrT Ty deriving (Show, Eq)

data Pattern = Px | PRecord [(String, Pattern)] deriving (Show, Eq)

addbinding :: Context -> String -> Binding -> Context
addbinding ctx x bind = ((x, bind) : ctx)

getTypeFromContext :: Context -> Int -> Maybe Ty
getTypeFromContext ctx i = case getbinding ctx i of 
				VarBind v -> return v
				otherwise -> Nothing

getbinding :: Context -> Int -> Binding				
getbinding ctx i = snd $ ctx !! i

getFirst :: Term -> Term
getFirst t = case t of 
		TmPair t1 t2 -> t1

getSecond :: Term -> Term
getSecond t = case t of 
		TmPair t1 t2 -> t2

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
		TmAs t1 tyt1 	-> retutn tyt1	
		TmLet x t1 t2	-> do tyt1 <- typeOf ctx t1 
				      typeOf ctx (TmApp (TmAbs x tyt1 t1) (t2))
		TmPair t1 t2 	-> do tyt1 <- typeOf ctx t1
				      tyt2 <- typeOf ctx t2
				      return (TyPair tyt1 tyt2)
		TmSum s		-> case s of 
					Inl t1 	-> do tyt1 <- typeOf ctx t1
						      return (TySum (InlT tyt1))
					Inr t1 	-> do tyt1 <- typeOf ctx t1
						      return (TySum (InrT tyt1))
					_	-> Nothing
		TmIsNil [ty1] (TmNil [ty2]) -> return TyBool
		TmIsNil [ty1] (TmCons [ty2] v1 v2) -> return TyBool
		TmHead [ty1] (TmCons [ty2] v1 v2) -> typeOf ctx v1
		TmTail [ty1] (TmCons [ty2] v1 v2) -> typeOf ctx v2
		TmNil [ty1] 	-> return (TyList ty1)
		TmCons [ty] t1 t2 -> do tyt1 <- typeOf ctx t1
					tyt2 <- typeOf ctx t2
					if (TyList tyt1 == tyt2) && tyt1 == ty then return tyt2 else Nothing
		TmError 	-> return TyError
		TmTry t1 t2	-> do tyt1 <- typeOf ctx t1 
				      tyt2 <- typeOf ctx t2 
				      if tyt1 == tyt2 then return tyt1 else Nothing
		_ 		-> Nothing
