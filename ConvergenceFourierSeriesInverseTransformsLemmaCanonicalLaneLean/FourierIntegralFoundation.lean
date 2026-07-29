import ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.ConvergenceCriteria

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierIntegralFoundation where
  kernel : FourierInversionKernelPackage
  kernelEvidence : FourierInversionKernelEvidence kernel
  criteria : ConvergenceCriteriaPackage (FourierIntegralStructure.mk)
  criteriaEvidence : ConvergenceCriteriaEvidence criteria
  endpoint : EndpointClassificationPackage
  endpointEvidence : EndpointClassificationEvidence endpoint

def FourierIntegralFoundationClosed (A : FourierIntegralFoundation) : Prop :=
  FourierInversionKernelClosed A.kernel ∧
  ConvergenceCriteriaClosed A.criteria ∧
  EndpointClassificationClosed A.endpoint

theorem fourier_integral_foundation_closed_from_evidence
    (A : FourierIntegralFoundation) :
    FourierIntegralFoundationClosed A := by
  exact And.intro (fourier_inversion_kernel_closed_from_evidence A.kernel A.kernelEvidence)
    (And.intro (convergence_criteria_closed_from_evidence A.criteria A.criteriaEvidence)
      (endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse