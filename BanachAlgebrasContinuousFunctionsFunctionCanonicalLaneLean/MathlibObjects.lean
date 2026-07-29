import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure BanachAlgebraObject where
  A : Type u
  norm : A → ℝ
  normedRing : NormedRing A
  normedAlgebra : NormedAlgebra ℝ A
  complete : CompleteSpace A
  commutative : Prop
  unital : Prop

structure ContinuousFunctionObject (X : Type u) [TopologicalSpace X] [CompactSpace X] where
  algebra : BanachAlgebraObject
  isCStarAlgebra : Prop
  gelfandTransformIsIsometric : Prop
  gelfandTransformIsSurjective : Prop

structure BanachAlgebraAdmittedObject where
  object : ContinuousFunctionObject (Unit)  -- placeholder, could be general
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : BanachAlgebraAdmittedObject) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse