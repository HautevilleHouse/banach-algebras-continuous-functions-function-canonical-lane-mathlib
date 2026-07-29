import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraProperties

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure GelfandTransformCertificate where
  isometric : Prop
  surjective : Prop
  homomorphism : Prop
  preservesInvolution : Prop
  isometricClosed : isometric
  surjectiveClosed : surjective
  homomorphismClosed : homomorphism
  preservesInvolutionClosed : preservesInvolution
  spectralEvidence : SpectralEvidence default

def GelfandTransformCertificateClosed (C : GelfandTransformCertificate) : Prop :=
  C.isometric ∧ C.surjective ∧ C.homomorphism ∧ C.preservesInvolution ∧ SpectralClosed default

theorem gelfand_transform_certificate_closed (C : GelfandTransformCertificate) :
    GelfandTransformCertificateClosed C := by
  exact And.intro C.isometricClosed
    (And.intro C.surjectiveClosed
      (And.intro C.homomorphismClosed
        (And.intro C.preservesInvolutionClosed (spectral_closed_from_evidence default C.spectralEvidence))))

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse