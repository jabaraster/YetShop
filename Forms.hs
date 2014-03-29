module Forms where

import Prelude
import Yesod hiding (Route(..))
import Foundation
import Control.Applicative ((<$>), (<*>))
import Model
import Yesod.Form.Bootstrap3

userForm :: Form User
userForm = userForm' Nothing

userForm' :: Maybe User -> Form User
userForm' mUser = renderBootstrap $ User
    <$> areq textField     "Ident"    (userIdent    <$> mUser)
    <*> aopt passwordField "Password" (userPassword <$> mUser)
