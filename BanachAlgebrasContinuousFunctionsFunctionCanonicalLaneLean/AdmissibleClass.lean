import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure AdmissibleBanachAlgebra where
  carrier : Type
  norm : carrier → ℝ
  algebraStructure : Prop
  complete : Prop
  conclusion : algebraStructure ∧ complete

structure AdmissibleClass where
  object : AdmissibleBanachAlgebra
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse