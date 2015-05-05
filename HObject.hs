module HObject where
import Data.List
import HRay
import HVec3
import HMaterial

data HObject = HSphere {
  position :: HVec3,
  radius :: Double,
  material :: HMaterial
} | HPlane {
  position :: HVec3,
  normal :: HVec3,
  material :: HMaterial
} deriving (Show)

intersect :: HRay -> HObject -> Maybe (HObject, Double)
intersect (HRay o d) (HSphere p r m) = let
  omp = o - p :: HVec3
  b = (dot d omp) * 2 :: Double
  c = (dot omp omp) - (r*r) :: Double
  discriminant = (b*b) - (4*c) :: Double
  in 
    if discriminant <= 0 then
      Nothing
    else
      let
        t1 = ( (-b) + sqrt(discriminant)) *0.5
        t2 = ( (-b) - sqrt(discriminant)) *0.5 
      in 
      Just ((HSphere p r m),min t1 t2)
        
intersect (HRay o d) (HPlane p n m) = let dp = d `dot` n in
  if dp == 0 then
    Nothing
  else
    let t = (p `dot` n) - (o `dot` n) / dp in 
      if t > 0 then
        Just ((HPlane p n m), t)
      else
        Nothing

surfaceNormal :: HObject -> HVec3 -> HVec3
surfaceNormal (HPlane _ n _) _ = n
surfaceNormal (HSphere p n _) i = norm (p --> i)