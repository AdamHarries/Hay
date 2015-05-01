module HVec3 where
--import Prelude hiding (Num(..))
--import qualified Prelude as P

data HVec3 = HVec3 {
  x :: Double,
  y :: Double,
  z :: Double
} deriving (Show, Eq)


instance Num HVec3 where
  -- Vector addition
  (+) (HVec3 a b c) (HVec3 x y z) = HVec3 (a + x) (b + y) (c + z)
  -- Vector subtraction
  (-) (HVec3 a b c) (HVec3 x y z) = HVec3 (a - x) (b - y) (c - z)
  -- Cross product
  (*) (HVec3 a b c) (HVec3 x y z) = HVec3 (b*z - z*b) (c*x - x*c) (a*y - y*a)

  abs (HVec3 x y z)               = HVec3 (abs x) (abs y) (abs z)
  signum (HVec3 x y z)            = HVec3 (signum x) (signum y) (signum z)
  fromInteger i                   = HVec3 (fromInteger i) (fromInteger i) (fromInteger i)

--Dot product
dot :: HVec3 -> HVec3 -> Double
dot (HVec3 a b c) (HVec3 x y z) = (a * x) + (b * y) + (z * c)

-- Scalar division
($/) :: HVec3 -> Double -> HVec3
($/) (HVec3 a b c) (s) = HVec3 (a/s) (b/s) (c/s)

-- Scalar multiplication
($*) :: HVec3 -> Double -> HVec3
($*) (HVec3 a b c) (s) = HVec3 (a*s) (b*s) (c*s)

-- Scalar addition
($+) :: HVec3 -> Double -> HVec3
($+) (HVec3 a b c) (s) = HVec3 (a+s) (b+s) (c+s)

-- Scalar subtraction
($-) :: HVec3 -> Double -> HVec3
($-) (HVec3 a b c) (s) = HVec3 (a-s) (b-s) (c-s)

-- get vector from "from" to "to"
(-->) :: HVec3 -> HVec3 -> HVec3
(-->) from to = to - from

-- normalise a vector
norm :: HVec3 -> HVec3
norm v = v $/ (len v)

-- get the length of vector
len :: HVec3 -> Double
len (HVec3 x y z) = sqrt((x*x)+(y*y)+(z*z))