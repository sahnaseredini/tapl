module InputData7 where

import Ch07

allTests :: [Term]
allTests = [test0, test1, test2, test3]
--allTests = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = (TMApp (TMApp (TMVar 0 1) (TMVar 1 2)) (TMVar 2 3))
test1 = (TMApp (TMAbs "1" (TMVar 0 1)) (TMVar 1 2))
test2 = (TMVar 0 1)
test3 = (TMAbs "1" (TMVar 0 1)) 
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
