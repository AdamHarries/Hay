module HColour where
import HVec3

data HColour = HColour {
  red :: Double,
  green :: Double,
  blue :: Double
} deriving (Show)

--green :: HColour -> Double
--green (HColour _ g _) = g
--red :: HColour -> Double
--red (HColour r _ _) = r
--blue :: HColour -> Double
--blue (HColour _ _ b) = b