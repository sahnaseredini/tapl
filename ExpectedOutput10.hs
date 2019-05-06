module ExpectedOutput10 where

import Ch10

allOutputs :: [Maybe Ty]
allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Just TyBool
test1 = Just TyBool
test2 = Just TyBool
test3 = Just TyBool
test4 = Just (TyArr TyBool TyBool)
test5 = Nothing
test6 = Just TyBool
test7 = Nothing
{-test8 = 
test9 = 
test10 = 
test11 = 
test12 = 
test13 = 
test14 = 
test15 = 
test16 = 
test17 = 
test18 = 
test19 = -}
