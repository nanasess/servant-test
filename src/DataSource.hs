{-# LANGUAGE TemplateHaskell #-}

module DataSource (
  connect
  -- , convTypes
--   , defineTable
  ) where

-- import           Data.Int                            (Int32)
import           Database.HDBC.PostgreSQL
import           Database.HDBC.Query.TH              (defineTableFromDB')
-- import           Database.HDBC.Schema.Driver         (typeMap)
import           Database.HDBC.Schema.PostgreSQL     (driverPostgreSQL)
import           Database.Record.TH
import           Database.Relational.Query.Component (defaultConfig,
                                                      normalizedTableName)
import           GHC.Generics                        (Generic)
import           Language.Haskell.TH                 (Dec, Q, TypeQ)

connect :: IO Connection
connect = connectPostgreSQL "host=127.0.0.1 port=5432 user=postgres dbname=brunabruna_db password=password"

-- convTypes :: [(String, TypeQ)]
-- convTypes = [("MEDIUMINT", [t|Int32|])]

-- defineTable :: String -> Q [Dec]
-- defineTable tableName =
--   defineTableFromDB'
--   connect
--   defaultConfig
--   driverPostgreSQL
--   "public"
--   tableName
--   [''Show, ''Generic]



