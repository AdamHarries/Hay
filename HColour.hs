module HColour where
import HVec3
import Codec.Picture
import Data.Word

type HColour = HVec3 

colourToPixel :: HColour -> PixelRGB8
colourToPixel (HVec3 red green blue) = PixelRGB8 rI gI bI where
  rI = round (red*255) :: Word8
  gI = round (green*255) :: Word8
  bI = round (blue*255) :: Word8


--allRed = HColour 1.0 0.0 0.0
--allGreen = HColour 0.0 1.0 0.0
--allBlue = HColour 0.0 0.0 1.0
--allBlack = HColour 0.0 0.0 0.0
--allWhite = HColour 1.0 1.0 1.0

green :: HColour -> Double
green (HVec3 _ g _) = g
red :: HColour -> Double
red (HVec3 r _ _) = r
blue :: HColour -> Double
blue (HVec3 _ _ b) = b
black :: HColour
black = (HVec3 0.0 0.0 0.0)