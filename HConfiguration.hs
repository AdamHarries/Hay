module HConfiguration where
import HVec3
import HObject
import HColour
import HLight

data HRenderSettings = HRenderSettings {
  camera :: HCamera, 
  renderPlane :: HRenderPlane
}

data HCamera = HCamera {
  position :: HVec3,
  direction :: HVec3,
  up :: HVec3,
  horizontalFOV :: Double
} deriving (Show)

data HRenderPlane = HRenderPlane {
  renderWidth :: Double,
  renderHeight :: Double, 
  imagePlaneWidth :: Double,
  imagePlaneHeight :: Double,
  imagePlaneX :: HVec3,
  imagePlaneY :: HVec3,
  aspectRatio :: Double
}

data HWorld = HWorld {
  objects :: [HObject],
  lights :: [HLight],
  backgroundColour :: HColour
}