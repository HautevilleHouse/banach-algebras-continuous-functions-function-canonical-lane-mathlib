import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure StoneWeierstrassPackage {B : BanachAlgebraOfContinuousFunctionsPackage}
    (E : BanachAlgebraOfContinuousFunctionsEvidence B) where
  denseSubalgebra : Prop
  separatesPoints : Prop
  subalgebraClosed : Prop
  approximatesUniformly : Prop
  denseSubalgebraTerm : denseSubalgebra
  separatesPointsTerm : separatesPoints
  subalgebraClosedTerm : subalgebraClosed
  approximatesUniformlyTerm : approximatesUniformly

structure StoneWeierstrassEvidence {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (S : StoneWeierstrassPackage E) where
  denseSubalgebraClosed : S.denseSubalgebra
  separatesPointsClosed : S.separatesPoints
  subalgebraClosedClosed : S.subalgebraClosed
  approximatesUniformlyClosed : S.approximatesUniformly

def StoneWeierstrassClosed {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (S : StoneWeierstrassPackage E) : Prop :=
  S.denseSubalgebra ∧ S.separatesPoints ∧ S.subalgebraClosed ∧ S.approximatesUniformly

theorem stone_weierstrass_closed_from_evidence
    {B : BanachAlgebraOfContinuousFunctionsPackage}
    {E : BanachAlgebraOfContinuousFunctionsEvidence B}
    (S : StoneWeierstrassPackage E)
    (SE : StoneWeierstrassEvidence S) : StoneWeierstrassClosed S := by
  exact And.intro SE.denseSubalgebraClosed
    (And.intro SE.separatesPointsClosed
      (And.intro SE.subalgebraClosedClosed SE.approximatesUniformlyClosed))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse