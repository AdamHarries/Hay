module HMaterial where
import HVec3
import HColour

data HMaterial = HMaterial {
  ambientIntensity  :: Double,
  diffuseColour     :: HColour,
  diffuseIntensity  :: Double,
  specularIntensity :: Double,
  phongAttenuation  :: Double,
  phongSpecularity  :: Double,
  reflectivity      :: Double,
  transparency      :: Double
} deriving (Show)

mirror :: HMaterial
mirror = (HMaterial 0 (HVec3 1.0 1.0 1.0) 0 0 1000 1000 0 0.7)

redMat :: HMaterial
redMat = (HMaterial 1.0 (HVec3 1.0 0.0 0.0) 1.0 1.0 1.0 1.0 0.0 0.0)

greenMat :: HMaterial
greenMat = (HMaterial 1.0 (HVec3 0.0 1.0 0.0) 1.0 1.0 1.0 1.0 0.0 0.0)

blueMat :: HMaterial
blueMat = (HMaterial 1.0 (HVec3 0.0 0.0 1.0) 1.0 1.0 1.0 1.0 0.0 0.0)