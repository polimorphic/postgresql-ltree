{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Postgresql.LTree ((<@), (@>)) where

import Database.PostgreSQL.LTree (LTree)
import Database.Esqueleto (SqlExpr, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlBinOp)

class SqlLTreeCompare d a r where
    (<@) :: SqlExpr (Value d) -> SqlExpr (Value a) -> SqlExpr (Value r)
    (<@) = unsafeSqlBinOp "<@"
    infixl 7 <@

    (@>) :: SqlExpr (Value a) -> SqlExpr (Value d) -> SqlExpr (Value r)
    (@>) = unsafeSqlBinOp "@>"
    infixl 7 @>

instance SqlLTreeCompare LTree LTree Bool
instance SqlLTreeCompare d a r => SqlLTreeCompare (Maybe d) (Maybe a) (Maybe r)
