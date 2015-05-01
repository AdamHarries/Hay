module HRay where
import HVec3

data HRay = HRay {
  origin :: HVec3,
  direction :: HVec3
} deriving (Show, Eq)


at (HRay o d) t = o + (d $* t)