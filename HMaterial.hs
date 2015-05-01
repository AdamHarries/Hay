module HMaterial where
import HColour



data Material = Material {
  ambientIntensity  :: Double,
  diffuseColour     :: HColour,
  diffuseIntensity  :: Double,
  specularIntensity :: Double,
  phongAttenuation  :: Double,
  phongSpecularity  :: Double,
  reflectivity      :: Double,
  transparency      :: Double
}