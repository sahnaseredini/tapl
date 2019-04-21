module ExpectedOutput7 where

import Ch07

allOutputs :: [Maybe Term]
allOutputs = [test0, test1, test2, test3]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Just (TMApp (TMApp (TMVar 0 1) (TMVar 1 2)) (TMVar 2 3))
test1 = Nothing
test2 = Just (TMVar 0 1)
test3 = Just (TMAbs "1" (TMVar 0 1))
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
