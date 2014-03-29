{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Handler.UserCreate where

import Import

getUserCreateR :: Handler Html
getUserCreateR = do
  (widget, enctype) <- generateFormPost userForm
  defaultLayout $ userFormWidget widget enctype

postUserCreateR :: Handler Html
postUserCreateR = do
  ((result, widget), enctype) <- runFormPost userForm
  case result of
    FormSuccess user -> do
             _ <- runDB $ insert user
             redirect UserIndexR
    _ -> defaultLayout $ userFormWidget widget enctype
