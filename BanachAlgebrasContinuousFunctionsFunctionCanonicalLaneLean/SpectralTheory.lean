import BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraStructures
import BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.GelfandTransform

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure SpectrumPackage (B : BanachAlgebraPackage) where
  spectrum : B.algebra → Set ℂ
  resolvent : B.algebra → Set ℂ
  spectralRadius : B.algebra → ℝ
  spectralRadiusIsSupNorm : Prop
  holomorphicFunctionalCalculus : Prop

structure SpectrumEvidence (B : BanachAlgebraPackage) (S : SpectrumPackage B) where
  spectralRadiusIsSupNormClosed : S.spectralRadiusIsSupNorm
  holomorphicFunctionalCalculusClosed : S.holomorphicFunctionalCalculus

def SpectrumClosed (B : BanachAlgebraPackage) (S : SpectrumPackage B) : Prop :=
  S.spectralRadiusIsSupNorm ∧ S.holomorphicFunctionalCalculus

theorem spectrum_closed_from_evidence (B : BanachAlgebraPackage) (S : SpectrumPackage B) (E : SpectrumEvidence B S) :
    SpectrumClosed B S := by
  exact And.intro E.spectralRadiusIsSupNormClosed E.holomorphicFunctionalCalculusClosed

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse