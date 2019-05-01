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

addbinding :: Context -> String -> Binding -> Context
addbinding ctx x bind = ((x, bind) : ctx)

getTypeFromContext :: Context -> Int -> Maybe Ty
getTypeFromContext ctx i = case getbinding ctx i of
                                VarBind v -> return v
                                otherwise -> Nothing

getbinding :: Context -> Int -> Binding
getbinding ctx i = snd $ ctx !! i

subtype :: Ty -> Ty -> Maybe Bool 
subtype (TyRecord tr1) (TyRecord tr2) = foldl (liftM2 (&&)) (Just True) $ map match tr2 where 
							match (s, tm2) = case lookup s tr1 of
										Just tm1 -> subtype tm1 tm2 
										_ -> return False
subtype _ TyTop = return True
subtype (TyArr tyS1 tyS2) (TyArr tyT1 tyT2) = liftM2 (&&) (subtype tyT1 tyS1) (subtype tyS2 tyT2)
subtype tyS tyT 
	| tyS == tyT = return True
	| otherwise = return False

typeOf :: Context -> Term -> Maybe Ty
typeOf ctx t = case t of
		TmRecord r	-> liftM TyRecord $ mapM f r where
								f (s, t1) = do tyt1 <- typeOf ctx t1
									       return (s, tyt1)
		TmProj t1 s 	-> case typeOf ctx t1 of 
					Just (TyRecord r) -> lookup s r
					_ -> Nothing
		TmVar i _       -> if i < length ctx then getTypeFromContext ctx i else Nothing
                TmAbs x tyt1 t2 -> let ctx' = addbinding ctx x (VarBind tyt1) in
                                        do tyt2 <- typeOf ctx' t2
                                           return (TyArr tyt1 tyt2)
                TmApp t1 t2     -> do   tyt1 <- typeOf ctx t1
                                        tyt2 <- typeOf ctx t2
                                        case tyt1 of
                                                TyArr tyt11 tyt12 -> if (subtype tyt2 tyt11) == (Just True) then return tyt12 else Nothing
                                                _ -> Nothing

