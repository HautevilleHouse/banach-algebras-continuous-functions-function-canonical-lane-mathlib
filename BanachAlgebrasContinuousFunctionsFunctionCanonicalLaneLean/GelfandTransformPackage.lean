import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraPackage
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.ContinuousFunctionsPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure GelfandTransformPackage {A : BanachAlgebraPackage} (X : CompactHausdorffSpace) where
  transform : A.carrier → (ContinuousFunctionsPackage X).carrier
  isometric : Isometry (fun a : A.carrier => (norm (transform a) : ℝ))
  multiplicative : ∀ a b, transform (a * b) = transform a * transform b
  unital : transform 1 = 1

def GelfandTransformClosed {A : BanachAlgebraPackage} {X : CompactHausdorffSpace} (G : GelfandTransformPackage A X) : Prop :=
  G.isometric ≠ 0 ∧ G.multiplicative ≠ 0  -- placeholder

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse