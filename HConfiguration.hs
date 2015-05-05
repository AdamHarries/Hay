module HConfiguration where
import HVec3
import HObject
import HColour
import HLight

data HRenderSettings = HRenderSettings {
  camera :: HCamera, 
  renderWidth :: Int,
  renderHeight :: Int,
  maxRayDepth :: Int,
  ambientLightingEnabled :: Bool

  -- TODO: antialiasing
  --antiAliasType       m_antiAliasType;
  --antiAliasQuality    m_antiAliasQuality;
}

data HCamera = HCamera {
  position :: HVec3,
  direction :: HVec3,
  up :: HVec3,
  horizontalFOV :: Double
} deriving (Show)

data HRenderPlane = HRenderPlane {
  renderWidth :: Int,
  renderHeight :: Int,
  imageData :: [[HColour]]
}

data HWorld = HWorld {
  objects :: [HObject],
  lights :: [HLight],
  backgroundColour :: HColour,
  ambientLightingColour :: HColour,
  ambientLightingIntensity :: Double
}