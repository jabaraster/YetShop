module Forms where

import Prelude
import Yesod hiding (Route(..))
import Foundation
import Control.Applicative ((<$>), (<*>))
import Data.Text (Text)

userForm :: Form (Text, Text)
userForm = userForm' Nothing

userForm' :: Maybe (Text, Text) -> Form (Text, Text)
userForm' t = renderDivs $ (,)
    <$> areq textField "Ident"    (fst <$> t)
    <*> areq passwordField "Password" Nothing
