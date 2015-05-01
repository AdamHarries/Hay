module Main where
import HVec3
import HRay
import HObject
import HMaterial
import HConfiguration
import HRenderer

main = do
  let sphere = (HSphere (HVec3 1 2 3) 1.0)
  putStrLn $ (++) "The centre of the sphere is: " $ show $ (radius sphere)
  putStrLn $ show (10*20)
  putStrLn $ (++) "Dot product: " $ show ((HVec3 1 2 3) `dot` (HVec3 2 3 4))
  putStrLn $ (++) "Addition: " $ show ((HVec3 1 2 3) + (HVec3 2 3 4))
  putStrLn $ (++) "Subtraction " $ show ((HVec3 1 2 3) - (HVec3 2 3 4))
  putStrLn $ (++) "Cross product " $ show ((HVec3 1 2 3) * (HVec3 2 3 4))
  putStrLn $ (++) "From/To " $ show ((HVec3 1 2 3) --> (HVec3 2 3 4))
  putStrLn $ (++) "Scalar division" $ show ((HVec3 1 2 3) $/ 2.0)
  putStrLn $ (++) "Scalar product" $ show ((HVec3 1 2 3) $* 2.0)

  putStrLn $ (++) "Plane " $ show (HPlane (HVec3 1 2 3) (HVec3 3 4 5))
  putStrLn $ (++) "Sphere " $ show (HSphere (HVec3 1 2 3) 1.0)
  putStrLn $ show $ firstIntersection (HRay (HVec3 100 0 0) (HVec3 (-1) 0 0)) [(HSphere (HVec3 0 0 0) 1.0)]