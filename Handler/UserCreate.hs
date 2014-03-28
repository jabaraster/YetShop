{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Handler.UserCreate where

import Import

getUserCreateR :: Handler Html
getUserCreateR = do
  (formWidget, formEnctype) <- generateFormPost userForm
  defaultLayout $ $(widgetFile "user-create")

postUserCreateR :: Handler Html
postUserCreateR = do
  ((formResult, formWidget), formEnctype) <- runFormPost userForm
  case formResult of
    FormSuccess (ident, password) -> do
             _ <- runDB $ insert $ User ident (Just password)
             defaultLayout $ $(widgetFile "user-create")
    _ -> defaultLayout $ $(widgetFile "user-create")
