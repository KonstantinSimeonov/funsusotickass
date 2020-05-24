#!/usr/bin/env runhaskell

import System.IO

padLeft :: Int -> Char -> String -> String
padLeft len char name = padding ++ name
  where
    padding = replicate (len - length name) char

main = sequence_ writes
  where
    writes = map writeTest tests
    writeTest :: (Int, (Int, Int)) -> IO ()
    writeTest (number, (input, output)) = do
      writeFile (testNumber ++ ".in.txt") (show input)
      writeFile (testNumber ++ ".out.txt") (show output)
      where
        testNumber = padLeft 3 '0' $ show number
    tests = zip [0..] cases
    cases = map (\n -> (n, fibs !! n)) [0, 1, 2, 3, 7, 8, 15, 31, 32, 33, 40, 27, 26, 49, 50]
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
