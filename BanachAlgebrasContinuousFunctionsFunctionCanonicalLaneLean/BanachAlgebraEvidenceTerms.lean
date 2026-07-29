import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean.BanachAlgebraAnalyticProof

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean

structure GelfandTransformEvidenceTerms (C : GelfandTransformCertificate) where
  isometricTerm : C.isometric
  surjectiveTerm : C.surjective
  homomorphismTerm : C.homomorphism
  preservesInvolutionTerm : C.preservesInvolution
  certificateClosed : GelfandTransformCertificateClosed C

def GelfandTransformCertificate.evidenceTerms (C : GelfandTransformCertificate) :
    GelfandTransformEvidenceTerms C :=
  {
    isometricTerm := C.isometricClosed
    surjectiveTerm := C.surjectiveClosed
    homomorphismTerm := C.homomorphismClosed
    preservesInvolutionTerm := C.preservesInvolutionClosed
    certificateClosed := gelfand_transform_certificate_closed C
  }

end BanachAlgebrasContinuousFunctionsFunctionCanonicalLaneLean
end HautevilleHouse