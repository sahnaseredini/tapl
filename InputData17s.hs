module InputData17s where

import Ch17

allTests :: [Term]
allTests = [test0, test1, test2, test3, test4]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = ((TyArr TyTop TyTop) (TyArr TyTop (TyRecord [("x", TyTop)])))
test1 = (TyArr TyTop TyTop) (TyArr TyTop TyTop)
test2 = (TyArr TyTop TyTop) TyTop
test3 = TyTop (TyArr TyTop TyTop)
test4 = TyTop TyTop
{-test5 = 
test6 = 
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
