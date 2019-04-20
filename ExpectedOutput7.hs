module ExpectedOutput7 where

import Ch07

allOutputs :: [Maybe Term]
allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Just TMZero
test1 = Nothing
test2 = Just TMZero
test3 = Nothing
test4 = Nothing 
test5 = Just TMZero
test6 = Nothing
test7 = Nothing
test8 = Nothing
test9 = Just TMTrue
test10 = Nothing
{-test11 = 
test12 = 
test13 = 
test14 = 
test15 = 
test16 = 
test17 = 
test18 = 
test19 = -}
