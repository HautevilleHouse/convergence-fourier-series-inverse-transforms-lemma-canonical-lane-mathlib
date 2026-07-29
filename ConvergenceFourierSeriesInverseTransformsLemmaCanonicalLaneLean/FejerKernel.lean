import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FejerKernelPackage where
  kernelDefinition : (ℕ → ℝ → ℝ)
  cesaroSumFormula : Prop
  uniformConvergence : Prop
  fejerTheorem : Prop

structure FejerKernelEvidence (F : FejerKernelPackage) where
  kernelDefinitionClosed : True
  cesaroSumFormulaClosed : F.cesaroSumFormula
  uniformConvergenceClosed : F.uniformConvergence
  fejerTheoremClosed : F.fejerTheorem

def FejerKernelClosed (F : FejerKernelPackage) : Prop :=
  F.cesaroSumFormula ∧ F.uniformConvergence ∧ F.fejerTheorem

theorem fejer_kernel_closed_from_evidence
    (F : FejerKernelPackage) (E : FejerKernelEvidence F) :
    FejerKernelClosed F :=
  And.intro E.cesaroSumFormulaClosed
    (And.intro E.uniformConvergenceClosed E.fejerTheoremClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse