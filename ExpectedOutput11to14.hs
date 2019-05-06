module ExpectedOutput11to14 where

import Ch11to14

allOutputs :: [Maybe Ty]
allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Just (TyList TyBool)
test1 = Just TyError
test2 = Nothing
test3 = Just TyUnit
test4 = Just TyBool
test5 = Nothing
test6 = Nothing
test7 = Just (TyList (TyArr TyBool TyBool))
test8 = Nothing
test9 = Just TyBool
test10 = Just (TySum (InlT TyUnit))
{-test11 = 
test12 = 
test13 = 
test14 = 
test15 = 
test16 = 
test17 = 
test18 = 
test19 = -}
