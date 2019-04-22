module InputData10 where

import Ch10

allTests :: [Term]
allTests = [test0, test1, test2, test3, test4, test5]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = TmTrue
test1 = (TmIf TmTrue (TmVar 0 1) TmFalse)
test2 = TmFalse
test3 = (TmApp (TmAbs "y" TyBool TmFalse) (TmVar 0 1))
test4 = (TmApp (TmAbs "y" TyBool (TmAbs "z" TyBool TmTrue)) (TmVar 0 1))
test5 = (TmApp (TmAbs "y" TyBool (TmVar 0 1)) (TmAbs "z" TyBool TmTrue))
{-test6 = 
test7 = 
test8 = 
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
