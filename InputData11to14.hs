module InputData11to14 where

import Ch11to14

allTests :: [Term]
allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = (TmCons [TyBool] TmTrue (TmNil [TyBool]))
test1 = (TmApp (TmAbs "x" TyBool TmError) TmFalse)
test2 = (TmCons [(TyArr TyBool TyBool)] TmTrue (TmNil [TyBool]))
test3 = (TmAs (TmApp (TmAbs "x" TyBool TmTrue) TmFalse) TyUnit)
test4 = (TmLet "x" TmFalse TmTrue)
test5 = (TmPair (TmIsNil [TyUnit] (TmNil [TyBool])) (TmCons [(TyArr TyBool TyBool)] TmTrue (TmNil [TyBool])))
test6 = (TmCons [(TyArr TyBool TyBool)](TmNil [TyBool]) (TmNil [TyArr TyBool TyBool]))
test7 = (TmCons [(TyArr TyBool TyBool)](TmAbs "y" TyBool TmFalse) (TmNil [TyArr TyBool TyBool]))
test8 = (TmTry (TmHead [TyBool] (TmCons [TyArr TyBool TyBool] TmTrue TmFalse)) (TmNil [TyBool]))
test9 = (TmTry (TmHead [TyBool] (TmCons [TyArr TyBool TyBool] TmTrue TmFalse)) (TmTrue))
test10 = (TmSum (Inl (TmAs TmFalse TyUnit)))
{-test11 = 
test12 = 
test13 = 
test14 = 
test15 = 
test16 = 
test17 = 
test18 = 
test19 = -}
