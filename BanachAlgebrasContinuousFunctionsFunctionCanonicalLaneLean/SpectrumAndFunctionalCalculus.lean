import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure SpectrumPackage (A : BanachAlgebraContinuousFunctionsObject) where
  spectrum : A.A → Set ℂ
  compactness : ∀ x : A.A, IsCompact (spectrum x)
  nonempty : ∀ x : A.A, Set.Nonempty (spectrum x) -- if A has unit, for invertible elements? Actually always nonempty for unital Banach algebras
  spectralRadiusFormula : ∀ x : A.A, sup (fun λ : ℂ => |λ|) (spectrum x) = lim (fun n : ℕ => ‖x ^ n‖^(1/n : ℝ))

structure FunctionalCalculusPackage {A : BanachAlgebraContinuousFunctionsObject} (S : SpectrumPackage A) where
  continuousFunctionalCalculus : ∀ x : A.A, C(S.spectrum x, ℂ) → A.A
  properties : ∀ (x : A.A) (f g : C(S.spectrum x, ℂ)) (a : ℂ),
    continuousFunctionalCalculus x (a • f + g) = a • (continuousFunctionalCalculus x f) + (continuousFunctionalCalculus x g) ∧
    continuousFunctionalCalculus x (f * g) = (continuousFunctionalCalculus x f) * (continuousFunctionalCalculus x g) ∧
    continuousFunctionalCalculus x (fun λ : S.spectrum x => λ) = x

def SpectrumClosed {A : BanachAlgebraContinuousFunctionsObject} (S : SpectrumPackage A) : Prop :=
  S.compactness ∧ S.nonempty ∧ S.spectralRadiusFormula

theorem spectrum_closed_from_package {A : BanachAlgebraContinuousFunctionsObject} (S : SpectrumPackage A) (h1 : ∀ x, IsCompact (S.spectrum x)) (h2 : ∀ x, Set.Nonempty (S.spectrum x)) (h3 : ∀ x, sup (fun λ : ℂ => |λ|) (S.spectrum x) = lim (fun n : ℕ => ‖x ^ n‖^(1/n : ℝ))) : SpectrumClosed S := by
  exact And.intro (h1) (And.intro (h2) (h3))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse