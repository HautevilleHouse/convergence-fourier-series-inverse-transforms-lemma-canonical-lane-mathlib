import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure DirichletKernelPackage where
  kernelDefinition : (ℕ → ℝ → ℝ)
  kernelNorm : ℕ → ℝ
  partialSumFormula : Prop
  uniformBoundedness : Prop

structure DirichletKernelEvidence (D : DirichletKernelPackage) where
  kernelDefinitionClosed : True
  kernelNormClosed : True
  partialSumFormulaClosed : D.partialSumFormula
  uniformBoundednessClosed : D.uniformBoundedness

def DirichletKernelClosed (D : DirichletKernelPackage) : Prop :=
  D.partialSumFormula ∧ D.uniformBoundedness

theorem dirichlet_kernel_closed_from_evidence
    (D : DirichletKernelPackage) (E : DirichletKernelEvidence D) :
    DirichletKernelClosed D :=
  And.intro E.partialSumFormulaClosed E.uniformBoundednessClosed

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse