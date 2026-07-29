import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.FourierSeriesPackage
import HautevilleHouse.ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.InverseTransformPackage

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergenceLemmaPackage {F : FourierSeriesPackage}
    (I : InverseTransformPackage F) where
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  LpConvergence : Prop
  convergenceRate : Prop

structure ConvergenceLemmaEvidence {F : FourierSeriesPackage}
    {I : InverseTransformPackage F} (C : ConvergenceLemmaPackage I) where
  pointwiseConvergenceClosed : C.pointwiseConvergence
  uniformConvergenceClosed : C.uniformConvergence
  LpConvergenceClosed : C.LpConvergence
  convergenceRateClosed : C.convergenceRate

def ConvergenceLemmaClosed {F : FourierSeriesPackage}
    {I : InverseTransformPackage F} (C : ConvergenceLemmaPackage I) : Prop :=
  C.pointwiseConvergence ∧ C.uniformConvergence ∧
  C.LpConvergence ∧ C.convergenceRate

theorem convergence_lemma_closed_from_evidence {F : FourierSeriesPackage}
    {I : InverseTransformPackage F} (C : ConvergenceLemmaPackage I)
    (E : ConvergenceLemmaEvidence C) : ConvergenceLemmaClosed C := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.LpConvergenceClosed E.convergenceRateClosed))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse