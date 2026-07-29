import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure SpectralProperties where
  spectralRadiusFormula : Prop
  spectralRadiusFinite : Prop
  spectralMappingTheorem : Prop
  spectralContinuity : Prop

structure SpectralEvidence (S : SpectralProperties) where
  spectralRadiusFormulaClosed : S.spectralRadiusFormula
  spectralRadiusFiniteClosed : S.spectralRadiusFinite
  spectralMappingTheoremClosed : S.spectralMappingTheorem
  spectralContinuityClosed : S.spectralContinuity

def SpectralClosed (S : SpectralProperties) : Prop :=
  S.spectralRadiusFormula ∧ S.spectralRadiusFinite ∧
  S.spectralMappingTheorem ∧ S.spectralContinuity

theorem spectral_closed_from_evidence (S : SpectralProperties) (E : SpectralEvidence S) :
    SpectralClosed S := by
  exact And.intro E.spectralRadiusFormulaClosed
    (And.intro E.spectralRadiusFiniteClosed
      (And.intro E.spectralMappingTheoremClosed E.spectralContinuityClosed))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse