{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}

module Entity.Country where

import           Database.HDBC.Query.TH          (defineTableFromDB)
import           Database.HDBC.Record.Query      (runQuery')
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
-- -- import           Database.Relational.Query
import           Database.Relational.Query.Type  (relationalQuery)
import           DataSource                      (connect, defineTable)
import           GHC.Generics                    (Generic)

$(defineTableFromDB
  connect
  driverPostgreSQL
  "public"
  "mtb_country"
  [''Show, ''Generic])

showAllCountries :: IO()
showAllCountries = do
  conn <- connect
  countries <- runQuery' conn (relationalQuery mtbCountry) ()
  mapM_ print countries

main :: IO ()
main = print "app"

-- showJapan :: Relation () String
-- showJapan = relation $ do
--   i <- query mtbCountry
--   wheres $ i ! mtbCountry.id .=. value 392
--   return (i ! mtbCountry.name)

