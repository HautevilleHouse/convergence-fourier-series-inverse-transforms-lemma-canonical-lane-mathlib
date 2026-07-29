import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure InverseTransformKernelPackage where
  kernelFunction : Type u
  integrability : Prop
  boundedness : Prop
  approximationIdentity : Prop

structure InverseTransformKernelEvidence (K : InverseTransformKernelPackage) where
  integrabilityClosed : K.integrability
  boundednessClosed : K.boundedness
  approximationIdentityClosed : K.approximationIdentity

def InverseTransformKernelClosed (K : InverseTransformKernelPackage) : Prop :=
  K.integrability ∧ K.boundedness ∧ K.approximationIdentity

theorem inverse_transform_kernel_closed_from_evidence
    (K : InverseTransformKernelPackage) (E : InverseTransformKernelEvidence K) :
    InverseTransformKernelClosed K := by
  exact And.intro E.integrabilityClosed
    (And.intro E.boundednessClosed E.approximationIdentityClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse