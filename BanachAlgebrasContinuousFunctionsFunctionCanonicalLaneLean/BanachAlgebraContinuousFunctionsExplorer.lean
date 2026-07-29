import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure ExampleContinuousFunctions where
  X : Type u
  [topology : TopologicalSpace X]
  [compact : CompactSpace X]
  [hausdorff : T2Space X]
  algebra : Type v
  [normedRing : NormedRing algebra]
  [normedAlgebra : NormedAlgebra ℂ algebra]
  [completeSpace : CompleteSpace algebra]
  algebraStructure : algebra ≃ C(X, ℂ)
  
def example_admissible_class (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X] : AdmissibleClass where
  object := {
    A := C(X, ℂ)
    isCommutative := by
      intro f g
      ext x
      simp
    hasUnit := by
      refine ⟨fun _ => 1, ?_⟩
      intro f
      ext x
      simp
    gelfandIsIsometric := by
      refine Isometry.isComplete_range (?_ : Isometry (λ f : C(X, ℂ) => f))
      refine ⟨by
        intro f g
        ext x
        rfl⟩
    conclusion := by
      constructor
      · exact C(X, ℂ) 
      · constructor
        · exact algebraMap ℂ (C(X, ℂ))
        · exact fun a b => a * b
  }
  endpointSatisfied := True
  remainderRecorded := True
  gateWitness := Or.inl trivial

theorem example_bridge_closed (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X] : bridgeClosed (example_admissible_class X) := by
  unfold bridgeClosed
  trivial

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse