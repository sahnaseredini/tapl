module ExpectedOutput17 where

import Ch17

allOutputs :: [Maybe Ty]
allOutputs = [test0, test1, test2, test3]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Nothing
test1 = Just TyTop
test2 = Nothing
test3 = Just TyTop
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
