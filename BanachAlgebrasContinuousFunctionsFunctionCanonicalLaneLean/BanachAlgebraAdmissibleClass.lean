import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure BanachAlgebraAdmittedObject where
  algebra : Type u
  norm : algebra → ℝ
  complete : Prop
  commutative : Prop
  conclusion : commutative

structure AdmissibleClass where
  object : BanachAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse