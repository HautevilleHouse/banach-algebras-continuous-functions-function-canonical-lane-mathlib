import BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraAdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure SpectrumPackage where
  algebra : Type u
  element : algebra
  spectrum : Set ℂ
  compact : Prop
  nonempty : Prop
  spectralRadiusFormula : Prop

structure SpectrumEvidence (S : SpectrumPackage) where
  compactClosed : S.compact
  nonemptyClosed : S.nonempty
  spectralRadiusFormulaClosed : S.spectralRadiusFormula

def SpectrumClosed (S : SpectrumPackage) : Prop :=
  S.compact ∧ S.nonempty ∧ S.spectralRadiusFormula

theorem spectrum_closed_from_evidence (S : SpectrumPackage)
    (E : SpectrumEvidence S) : SpectrumClosed S := by
  exact And.intro E.compactClosed (And.intro E.nonemptyClosed E.spectralRadiusFormulaClosed)

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse