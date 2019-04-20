module InputData where

import Ch04

allTests :: [Term]
allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = (TMIf (TMIsZero TMZero)  TMZero TMFalse)
test1 = (TMIf (TMIf (TMIf (TMIsZero TMZero) TMZero TMFalse) TMZero TMTrue) TMZero TMFalse)
test2 = (TMIf (TMIf (TMIf (TMIsZero (TMSucc TMZero)) TMZero TMFalse) TMZero TMTrue) TMZero TMFalse)
test3 = (TMSucc TMTrue) 
test4 = (TMSucc (TMIf TMTrue TMZero TMFalse))
test5 = (TMPred (TMIf TMFalse TMTrue TMZero))
test6 = (TMSucc (TMIf TMFalse TMZero TMFalse))
test7 = (TMSucc TMTrue)
test8 = (TMIsZero (TMIf (TMIf (TMIsZero TMZero) TMZero TMFalse) TMZero TMTrue))
test9 =  (TMIsZero (TMIf (TMIf (TMIsZero (TMSucc TMZero)) TMZero TMFalse) TMTrue TMZero))
test10 =  (TMIsZero (TMIf (TMIf (TMIsZero (TMSucc TMZero)) TMZero TMFalse) TMZero TMTrue))
{-test11 = 
test12 = 
test13 = 
test14 = 
test15 = 
test16 = 
test17 = 
test18 = 
test19 = -}
