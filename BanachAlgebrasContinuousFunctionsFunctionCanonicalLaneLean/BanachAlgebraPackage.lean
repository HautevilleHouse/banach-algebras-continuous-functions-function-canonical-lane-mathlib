import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure BanachAlgebraOfContinuousFunctionsPackage where
  space : Type u
  topology : TopologicalSpace space
  compact : Prop
  hausdorff : Prop
  algebraStructure : Prop
  norm : Prop
  complete : Prop
  continuousFunctions : Prop
  banachAlgebraAxioms : Prop

structure BanachAlgebraOfContinuousFunctionsEvidence (B : BanachAlgebraOfContinuousFunctionsPackage) where
  compactClosed : B.compact
  hausdorffClosed : B.hausdorff
  algebraStructureClosed : B.algebraStructure
  normClosed : B.norm
  completeClosed : B.complete
  continuousFunctionsClosed : B.continuousFunctions
  banachAlgebraAxiomsClosed : B.banachAlgebraAxioms

def BanachAlgebraOfContinuousFunctionsClosed (B : BanachAlgebraOfContinuousFunctionsPackage) : Prop :=
  B.compact ∧ B.hausdorff ∧ B.algebraStructure ∧ B.norm ∧ B.complete ∧ B.continuousFunctions ∧ B.banachAlgebraAxioms

theorem banach_algebra_of_continuous_functions_closed_from_evidence
    (B : BanachAlgebraOfContinuousFunctionsPackage)
    (E : BanachAlgebraOfContinuousFunctionsEvidence B) :
    BanachAlgebraOfContinuousFunctionsClosed B := by
  exact And.intro E.compactClosed
    (And.intro E.hausdorffClosed
      (And.intro E.algebraStructureClosed
        (And.intro E.normClosed
          (And.intro E.completeClosed
            (And.intro E.continuousFunctionsClosed E.banachAlgebraAxiomsClosed)))))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse