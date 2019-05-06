module InputData17 where

import Ch17

allTests :: [Term]
allTests = [test0, test1, test2, test3]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = (TmProj (TmVar 0 1) "x")
test1 = (TmProj (TmRecord [("x", (TmVar 0 0))]) "x")
test2 = (TmProj (TmRecord [("x", (TmVar 0 0))]) "y")
test3 = (TmApp (TmAbs "x" TyTop (TmVar 0 1)) (TmVar 0 1))
{-test4 = 
test5 = 
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
