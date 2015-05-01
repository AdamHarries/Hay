module HRenderer where
import Data.List as DL
import HVec3
import HRay
import HObject
import HColour
import HMaterial
import HConfiguration

traceRay :: HRenderSettings -> HWorld -> HRay -> Int -> HColour
traceRay _ (HWorld _ _ bgColour) _ 0 = bgColour
traceRay settings world ray n = let cObj = firstIntersection ray (objects world) in
  case cObj of 
    Just (o,d) -> ambientColour + lightingColour + reflectionColour + translucentColour where
      ambientColour = 
      lightingColour = 
      reflectionColour = 
      translucentColour = 


    undefined
      -- algorithm sketch:
      -- get where we collide, and the normal
      -- caluculate ambient lighting etc 
      -- calculate any lighting effects
      -- calculate any reflection effects - DO IN PARALLEL???
      -- calculate any transparency effects -- DO IN PARALLEL???


     -- handle what happens when we collide!
    Nothing -> backgroundColour world






---- find a list of objects the ray intersects with
---- may need to test in case the intersection is at 0...
intersectList :: HRay -> [HObject] -> Maybe [(HObject, Double)]
intersectList ray objects = sequence $ map (HObject.intersect ray) objects

closest :: [(HObject,Double)] -> (HObject, Double)
closest objects = DL.minimumBy comp objects where
  comp (_,d) (_,d') = compare d d' 

firstIntersection :: HRay -> [HObject] -> Maybe (HObject, Double)
--firstIntersection ray objects = let isecs = intersectList ray objects in 
--  case isecs of
--    Just isecs -> Just (closest isecs)
--    Nothing -> Nothing

firstIntersection ray objects = intersectList ray objects >>= (return . closest)
