module ExpectedOutput where

import Ch04

allOutputs :: [Maybe Term]
allOutputs = [test0, test1, test2]
--allOutputs = [test0, test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13, test14, test15, test16, test17, test18, test19]

test0 = Just TMZero
test1 = Nothing
test2 = Just TMZero
{-test3 = 
test4 = 
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
