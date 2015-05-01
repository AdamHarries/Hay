module HLight where
import HVec3
import HColour

data HLight = HLight {
  colour :: HColour,
  intensity :: Double,
  position :: HVec3
} deriving (Show)