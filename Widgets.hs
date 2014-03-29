module Widgets where

import Yesod
import Settings
import Foundation

userFormWidget :: Widget -> Enctype -> Widget
userFormWidget formWidget formEnctype = $(widgetFile "user-create")
