{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Handler.UserIndex where

import Import

getUserIndexR :: Handler Html
getUserIndexR = do
        users <- runDB $ selectList [] []
        defaultLayout $ do
          setTitle "ユーザ一覧"
          $(widgetFile "user-list")
