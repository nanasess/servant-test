module Main where

import           Database.HDBC.Record (runQuery)
import           DataSource
import           GHC.Int
import           Lib

main :: IO ()
main = startApp
