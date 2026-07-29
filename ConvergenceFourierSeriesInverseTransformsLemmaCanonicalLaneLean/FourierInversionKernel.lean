import ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.FourierIntegralAdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierInversionKernelPackage where
  kernelFunction : Type u
  integrabilityCondition : Prop
  approximationIdentity : Prop
  dirichletKernelConvergence : Prop
  fejerKernelConvergence : Prop

structure FourierInversionKernelEvidence (K : FourierInversionKernelPackage) where
  kernelFunctionClosed : K.kernelFunction
  integrabilityConditionClosed : K.integrabilityCondition
  approximationIdentityClosed : K.approximationIdentity
  dirichletKernelConvergenceClosed : K.dirichletKernelConvergence
  fejerKernelConvergenceClosed : K.fejerKernelConvergence

def FourierInversionKernelClosed (K : FourierInversionKernelPackage) : Prop :=
  K.kernelFunction ∧ K.integrabilityCondition ∧ K.approximationIdentity ∧
  K.dirichletKernelConvergence ∧ K.fejerKernelConvergence

theorem fourier_inversion_kernel_closed_from_evidence
    (K : FourierInversionKernelPackage) (E : FourierInversionKernelEvidence K) :
    FourierInversionKernelClosed K := by
  exact And.intro E.kernelFunctionClosed
    (And.intro E.integrabilityConditionClosed
      (And.intro E.approximationIdentityClosed
        (And.intro E.dirichletKernelConvergenceClosed
          E.fejerKernelConvergenceClosed)))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse