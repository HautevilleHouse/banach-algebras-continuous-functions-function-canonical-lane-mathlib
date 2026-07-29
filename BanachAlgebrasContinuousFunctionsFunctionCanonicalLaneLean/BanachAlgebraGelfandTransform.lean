import BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraAdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure GelfandTransformPackage where
  algebra : Type u
  characterSpace : Type v
  gelfandTransform : algebra → (characterSpace → ℂ)
  isometric : Prop
  surjective : Prop
  multiplicative : Prop

structure GelfandTransformEvidence (G : GelfandTransformPackage) where
  isometricClosed : G.isometric
  surjectiveClosed : G.surjective
  multiplicativeClosed : G.multiplicative

def GelfandTransformClosed (G : GelfandTransformPackage) : Prop :=
  G.isometric ∧ G.surjective ∧ G.multiplicative

theorem gelfand_transform_closed_from_evidence (G : GelfandTransformPackage)
    (E : GelfandTransformEvidence G) : GelfandTransformClosed G := by
  exact And.intro E.isometricClosed (And.intro E.surjectiveClosed E.multiplicativeClosed)

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse