import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure BanachAlgebraAdmittedObject where
  algebra : Type u
  [normedAlgebra : NormedAlgebra ℝ algebra]
  [completeSpace : CompleteSpace algebra]
  isCommutative : Prop
  isUnital : Prop
  gelfandSpectrum : Type v
  spectrumTopology : TopologicalSpace gelfandSpectrum
  isCompactHausdorff : Prop
  gelfandTransformIsIsometricIsomorphism : Prop
  conclusion : gelfandTransformIsIsometricIsomorphism

def BanachAlgebraWitnessClosed (O : BanachAlgebraAdmittedObject) : Prop :=
  O.gelfandTransformIsIsometricIsomorphism

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse