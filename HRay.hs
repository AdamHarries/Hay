module HRay where
import HVec3

data HRay = HRay {
  origin :: HVec3,
  direction :: HVec3
} deriving (Show, Eq)

-- project a ray for distance units, and the the point at the end
at :: HRay -> Double -> HVec3
at (HRay origin direction) distance = origin + (direction $* distance)