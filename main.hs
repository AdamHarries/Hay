module Main where
import HVec3
import HRay
import HObject
import HColour
import HMaterial
import HConfiguration
import HTracer
import Codec.Picture

main = do
  let sphere = (HSphere (HVec3 1 2 3) 1.0 mirror)
  putStrLn $ (++) "The centre of the sphere is: " $ show $ (radius sphere)
  putStrLn $ show (10*20)
  putStrLn $ (++) "Dot product: " $ show ((HVec3 1 2 3) `dot` (HVec3 2 3 4))
  putStrLn $ (++) "Addition: " $ show ((HVec3 1 2 3) + (HVec3 2 3 4))
  putStrLn $ (++) "Subtraction " $ show ((HVec3 1 2 3) - (HVec3 2 3 4))
  putStrLn $ (++) "Cross product " $ show ((HVec3 1 2 3) * (HVec3 2 3 4))
  putStrLn $ (++) "From/To " $ show ((HVec3 1 2 3) --> (HVec3 2 3 4))
  putStrLn $ (++) "Scalar division" $ show ((HVec3 1 2 3) $/ 2.0)
  putStrLn $ (++) "Scalar product" $ show ((HVec3 1 2 3) $* 2.0)

  putStrLn $ (++) "Plane " $ show (HPlane (HVec3 1 2 3) (HVec3 3 4 5) mirror)
  putStrLn $ (++) "Sphere " $ show (HSphere (HVec3 1 2 3) 1.0 mirror)
  putStrLn $ show $ firstIntersection (HRay (HVec3 100 0 0) (HVec3 (-1) 0 0)) [(HSphere (HVec3 0 0 0) 1.0 mirror)]


testWorld :: HWorld
testWorld = (HWorld [(HSphere (HVec3 1 2 3) 1.0 mirror)] [] (HVec3 1.0 1.0 1.0) (HVec3 1.0 1.0 1.0) 1.0)
  
testCamera :: HCamera 
testCamera = (HCamera (HVec3 0.0 0.0 0.0) (HVec3 1.0 0.0 0.0) (HVec3 0.0 1.0 0.0) 90)

testRenderPlane :: HRenderPlane 
testRenderPlane = (HRenderPlane 640 480 [[]])



writeImage :: HRenderPlane -> FilePath -> IO ()
writeImage (HRenderPlane w h d) outPath = writePng outPath $ generateImage extractPixels w h where
  extractPixels x y = colourToPixel ((d !! x) !! y)

