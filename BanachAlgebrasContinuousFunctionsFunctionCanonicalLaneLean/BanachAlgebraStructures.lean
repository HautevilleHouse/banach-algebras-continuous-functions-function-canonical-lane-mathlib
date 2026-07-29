import BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraObjects

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure BanachAlgebraPackage where
  algebra : Type u
  [normedAlgebra : NormedAlgebra ℝ algebra]
  [completeSpace : CompleteSpace algebra]
  isCommutative : Prop
  isUnital : Prop
  normBound : Prop
  submultiplicativity : Prop

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  isCommutativeClosed : B.isCommutative
  isUnitalClosed : B.isUnital
  normBoundClosed : B.normBound
  submultiplicativityClosed : B.submultiplicativity

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.isCommutative ∧ B.isUnital ∧ B.normBound ∧ B.submultiplicativity

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage) (E : BanachAlgebraEvidence B) :
    BanachAlgebraClosed B := by
  exact And.intro E.isCommutativeClosed (And.intro E.isUnitalClosed (And.intro E.normBoundClosed E.submultiplicativityClosed))

structure ContinuousFunctionsAlgebraPackage (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X] where
  algebra : Type v
  [normedAlgebra : NormedAlgebra ℝ algebra]
  [completeSpace : CompleteSpace algebra]
  isCommutative : Prop
  isUnital : Prop
  supNormEquivalence : Prop
  pointwiseMultiplication : Prop
  continuousEvaluation : Prop

structure ContinuousFunctionsAlgebraEvidence (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X] (C : ContinuousFunctionsAlgebraPackage X) where
  isCommutativeClosed : C.isCommutative
  isUnitalClosed : C.isUnital
  supNormEquivalenceClosed : C.supNormEquivalence
  pointwiseMultiplicationClosed : C.pointwiseMultiplication
  continuousEvaluationClosed : C.continuousEvaluation

def ContinuousFunctionsAlgebraClosed (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X] (C : ContinuousFunctionsAlgebraPackage X) : Prop :=
  C.isCommutative ∧ C.isUnital ∧ C.supNormEquivalence ∧ C.pointwiseMultiplication ∧ C.continuousEvaluation

theorem continuous_functions_algebra_closed_from_evidence (X : Type u) [TopologicalSpace X] [CompactSpace X] [T2Space X]
    (C : ContinuousFunctionsAlgebraPackage X) (E : ContinuousFunctionsAlgebraEvidence X C) :
    ContinuousFunctionsAlgebraClosed X C := by
  exact And.intro E.isCommutativeClosed (And.intro E.isUnitalClosed (And.intro E.supNormEquivalenceClosed (And.intro E.pointwiseMultiplicationClosed E.continuousEvaluationClosed)))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse