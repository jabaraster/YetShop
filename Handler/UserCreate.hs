{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Handler.UserCreate where

import Import

getUserCreateR :: Handler Html
getUserCreateR = do
  (formWidget, formEnctype) <- generateFormPost userForm
  defaultLayout $ $(widgetFile "user-create")

postUserCreateR :: Handler Html
postUserCreateR = undefined

userForm :: Form (Text, Text)
userForm = userForm' Nothing

userForm' :: Maybe (Text, Text) -> Form (Text, Text)
-- userForm' = undefined
{--
    --}
userForm' t = renderDivs $ (,)
    <$> areq textField "Ident"    (fst <$> t)
    <*> areq textField "Password" Nothing
