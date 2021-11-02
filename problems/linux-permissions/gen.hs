#!/usr/bin/env runhaskell

import Prelude
import System.IO

main = do
  let ps = "rwx-"
  let testCases = [ [r, w, x] | r <- "r-", w <- "w-", x <- "x-" ]
  let indexedCases = map (\(i, t) -> (if i < 9 then "0" ++ show i else show i, t)) $ zip [0..] testCases
  mapM (\(i, t) -> do
        writeFile (i ++ ".test.in.txt") t
        writeFile (i ++ ".test.out.txt") $ show $ toDec t
      ) $ indexedCases
  where
    toDec :: String -> Int
    toDec = foldl (+) 0 . map (\x -> case x of
        'r' -> 4
        'w' -> 2
        'x' -> 1
        '-' -> 0
      )
