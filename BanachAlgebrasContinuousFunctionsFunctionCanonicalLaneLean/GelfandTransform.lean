import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure GelfandTransformPackage {B : BanachAlgebraOfContinuousFunctionsPackage}
    (E : BanachAlgebraOfContinuousFunctionsEvidence B) where
  characterSpace : Type u
  characterTopology : TopologicalSpace characterSpace
  characterSpaceCompact : Prop
  characterSpaceHausdorff : Prop
  gelfandMap : Prop
  isometricIsomorphism : Prop
  surjective : Prop
  gelfandMapTerm : gelfandMap
  isometricIsomorphismTerm : isometricIsomorphism
  surjectiveTerm : surjective

structure GelfandTransformEvidence {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (G : GelfandTransformPackage E) where
  characterSpaceCompactClosed : G.characterSpaceCompact
  characterSpaceHausdorffClosed : G.characterSpaceHausdorff
  gelfandMapClosed : G.gelfandMap
  isometricIsomorphismClosed : G.isometricIsomorphism
  surjectiveClosed : G.surjective

def GelfandTransformClosed {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (G : GelfandTransformPackage E) : Prop :=
  G.characterSpaceCompact ∧ G.characterSpaceHausdorff ∧ G.gelfandMap ∧ G.isometricIsomorphism ∧ G.surjective

theorem gelfand_transform_closed_from_evidence
    {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (G : GelfandTransformPackage E)
    (GE : GelfandTransformEvidence G) : GelfandTransformClosed G := by
  exact And.intro GE.characterSpaceCompactClosed
    (And.intro GE.characterSpaceHausdorffClosed
      (And.intro GE.gelfandMapClosed
        (And.intro GE.isometricIsomorphismClosed GE.surjectiveClosed)))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse