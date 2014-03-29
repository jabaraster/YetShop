{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Handler.User where

import Import

getUserR :: UserId -> Handler Html
getUserR userId = do
  user <- runDB $ get404 userId
  (formWidget, formEnctype) <- generateFormPost userForm
  defaultLayout $ $(widgetFile "user-detail")

postUserR :: UserId -> Handler Html
postUserR = undefined

